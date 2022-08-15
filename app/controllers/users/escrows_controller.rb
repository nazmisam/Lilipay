class Users::EscrowsController < ApplicationController
  before_action :set_escrow, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, :only=>[:paymentredirect]

  # GET /escrows or /escrows.json
  def index
    @escrows = Escrow.where("user_email = ? OR vendor_email = ?", current_user.email, current_user.email ).order(:id)
  end

  def request_refund
    @escrow = Escrow.find(params[:escrow_id])
    
  end

  # GET /escrows/1 or /escrows/1.json
  def show
    @escrow.generate_transaction_number
  end

  # GET /escrows/new
  def new
    @escrow = Escrow.new
  end

  # GET /escrows/1/edit
  def edit
  end

  # POST /escrows or /escrows.json
  def create

    @escrow = Escrow.new(escrow_params)
      
    respond_to do |format|
      if @escrow.save
        format.html { redirect_to user_escrows_url(@escrow), notice: "Escrow was successfully created." }
        format.json { render :show, status: :created, location: @escrow }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @escrow.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /escrows/1 or /escrows/1.json
  def update
  
    if @escrow.pending?
      approve
    elsif @escrow.approved?
      payment
    elsif @escrow.paid?
      processing
    elsif @escrow.processing?
      receive
    elsif @escrow.received?
      released
    end
  
  end

  # DELETE /escrows/1 or /escrows/1.json
  def destroy
    @escrow.destroy

    respond_to do |format|
      format.html { redirect_to user_escrows_url, notice: "Escrow was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def approve
    if params[:Reject]
      respond_to do |format|
        @escrow.update(status: 8)
        format.html { redirect_to user_escrows_url(@escrow), alert: "Escrow was rejected." }
        format.json { render :show, status: :ok, location: @escrow }
      end
    else
      respond_to do |format|
        @escrow.update(escrow_params)
        @escrow.update_columns(status: 1)
        format.html { redirect_to user_escrow_url(@escrow), notice: "Escrow was successfully updated." }
        format.json { render :show, status: :ok, location: @escrow }
      end
    end
  end
  
  def payment
    @escrow.generate_transaction_number
    if params[:Save]
      @escrow.update(escrow_params)
      respond_to do |format|
        format.html { redirect_to user_escrows_url(@escrow), alert: "Account bank details was saved." }
        format.json { render :show, status: :ok, location: @escrow }
      end
    elsif params[:Submit]
      if @escrow.update(escrow_params)
        @escrow.update(status:9)
        respond_to do |format|
          format.html { redirect_to user_escrows_url(@escrow), alert: "Account bank details was saved." }
          format.json { render :show, status: :ok, location: @escrow }
        end
      end
    else
      @escrow.update(escrow_params)
      @payment = Payment.new(escrow_id: @escrow.id, name: @escrow.buyer_name, contact_number: @escrow.shipping_attention, amount: @escrow.payment_amount, transaction_number: @escrow.transaction_number)
      if @payment.save
        params_api = {
          uid: "02b66d73-c60f-47e6-a07c-0aa3609ddddd",
          checksum: @escrow.generate_checksum,
          buyer_email: @escrow.buyer_email,
          buyer_name: @escrow.buyer_name,
          buyer_phone: @escrow.shipping_attention,
          order_number: @escrow.transaction_number,
          product_description: @escrow.description,
          transaction_amount: @escrow.total_pay,
          callback_url: "",
          redirect_url: "http://localhost:3000/users/escrows/paymentredirect",
          token: "ZiSzpYWJ4VY5xhb1W7M9",
          redirect_post: "true"
        }
        redirect_post("https://sandbox.securepay.my/api/v1/payments",            # URL, looks understandable
          params: params_api)
      else
        Rails.logger.debug "Failed to save"
      end
    end
  end

  def processing
    respond_to do |format|
      if @escrow.update(escrow_params)
    
          @escrow.update(status: 3)
          format.html { redirect_to user_escrow_url(@escrow), notice: "Escrow was successfully updated." }
          format.json { render :show, status: :ok, location: @escrow }

      end
    end
  end

  def receive
    respond_to do |format|
      if  @escrow.update(escrow_params)
        if @escrow.refund_reason.present?
          Rails.logger.debug "masuktakrefund #{@escrow.refund_reason}"
          @escrow.update(status: 5)
          format.html { redirect_to user_escrow_url(@escrow), notice: "Escrow was successfully updated." }
          format.json { render :show, status: :ok, location: @escrow }
        else
          @escrow.update(status: 4)
          format.html { redirect_to user_escrow_url(@escrow), notice: "Escrow was successfully updated." }
          format.json { render :show, status: :ok, location: @escrow }
        end
      end
    end
  end
  # def request_refund
  #   @escrow = Escrow.find(params[:escrow_id])
  # end
  def paymentredirect
   
    user = User.find_by(email: params[:buyer_email])
    
    payment_status = params[:payment_status]
    
    @escrow = Escrow.find_by(transaction_number: params[:order_number])
    if payment_status == "true"
      @escrow.update(status: 2)
      sign_in(user) if user.present?
      
      redirect_to user_escrow_path(id: @escrow.id), notice: "Payment Success!"
      
    else
      sign_in(user) if user.present?
      redirect_to user_escrows_path(id: @escrow.id), alert: "Payment unsuccessful!"
    
    end
  end

  def released
    respond_to do |format|
      if @escrow.update(escrow_params)
        format.html { redirect_to user_escrows_url(@escrow), notice: "Escrow was successfully updated." }
        format.json { render :show, status: :ok, location: @escrow }
      end
    end
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escrow
      @escrow = Escrow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def escrow_params
      params.require(:escrow).permit(:payment_method, :name_on_account, :country, :currency, :bank_code, :bank_name, :account_number, :user_id, :description, :refund_description, :refund_reason, :transaction_number, :buyer_email, :contact_number, :total_pay, :buyer_name, :proof, :status, :roles, :payment_for, :payment_amount, :transaction_fees, :user_email, :vendor_email, :invoice, :shipping_attention, :shipping_address, :shipping_postal, :shipping_city, :shipping_state, :shipping_country, :receipt, :tracking_number)
    end

end
