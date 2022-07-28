class Users::PaymentreleasesController < ApplicationController
  before_action :set_paymentrelease, only: %i[ show edit update destroy ]

  # GET /paymentreleases or /paymentreleases.json
  def index
    @paymentreleases = Paymentrelease.all
  end

  # GET /paymentreleases/1 or /paymentreleases/1.json
  def show
  end

  # GET /paymentreleases/new
  def new
    @paymentrelease = Paymentrelease.new
  end

  # GET /paymentreleases/1/edit
  def edit
  end

  # POST /paymentreleases or /paymentreleases.json
  def create
    @paymentrelease = Paymentrelease.new(paymentrelease_params)

    respond_to do |format|
      if @paymentrelease.save
        format.html { redirect_to paymentrelease_url(@paymentrelease), notice: "Paymentrelease was successfully created." }
        format.json { render :show, status: :created, location: @paymentrelease }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paymentrelease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paymentreleases/1 or /paymentreleases/1.json
  def update
    respond_to do |format|
      if @paymentrelease.update(paymentrelease_params)
        format.html { redirect_to paymentrelease_url(@paymentrelease), notice: "Paymentrelease was successfully updated." }
        format.json { render :show, status: :ok, location: @paymentrelease }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paymentrelease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paymentreleases/1 or /paymentreleases/1.json
  def destroy
    @paymentrelease.destroy

    respond_to do |format|
      format.html { redirect_to paymentreleases_url, notice: "Paymentrelease was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paymentrelease
      @paymentrelease = Paymentrelease.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def paymentrelease_params
      params.require(:paymentrelease).permit(:name, :contact_number, :amount, :description, :address, :postal_code, :city, :state, :country, :transaction_number, :escrow_id)
    end
end
