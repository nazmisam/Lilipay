class Users::EscrowsController < ApplicationController
  before_action :set_escrow, only: %i[ show edit update destroy ]

  # GET /escrows or /escrows.json
  def index
    @escrows = Escrow.where("user_email = ? OR vendor_email = ?", current_user.email, current_user.email )
  end

  # GET /escrows/1 or /escrows/1.json
  def show
    
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
      if @escrow.roles = 0
        @escrow.vendor_roles = 1
      elsif @escrow.roles = 1
        @escrow.vendor_roles = 0
      end
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
      pending
    elsif @escrow.approved?
      approve
    elsif @escrow.ship?
      ship
    elsif @escrow.paid?
      receive
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

  def pending
    respond_to do |format|
      @escrow.update(escrow_params)
      @escrow.update_columns(status: 1)
      format.html { redirect_to user_escrow_url(@escrow), notice: "Escrow was successfully updated." }
      format.json { render :show, status: :ok, location: @escrow }
    end
  end
  
  def approve
    respond_to do |format|
      @escrow.update(escrow_params)
      @escrow.update_columns(status: 2)
      format.html { redirect_to user_escrow_url(@escrow), notice: "Escrow was successfully updated." }
      format.json { render :show, status: :ok, location: @escrow }
    end
  end

  def ship
    respond_to do |format|
      @escrow.update(escrow_params)
      @escrow.update_columns(status: 3)
      format.html { redirect_to user_escrow_url(@escrow), notice: "Escrow was successfully updated." }
      format.json { render :show, status: :ok, location: @escrow }
    end
  end

  def receive
    respond_to do |format|
      @escrow.update(escrow_params)
      @escrow.update_columns(status: 4)
      format.html { redirect_to user_escrow_url(@escrow), notice: "Escrow was successfully updated." }
      format.json { render :show, status: :ok, location: @escrow }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escrow
      @escrow = Escrow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def escrow_params
      params.require(:escrow).permit(:proof, :vendor_roles, :status, :roles, :payment_for, :payment_amount, :transaction_fees, :user_email, :vendor_email, :invoice, :shipping_attention, :shipping_address, :shipping_postal, :shipping_city, :shipping_state, :shipping_country, :receipt, :tracking_number)
    end

end
