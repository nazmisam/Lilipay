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

    respond_to do |format|
      if @escrow.save
        format.html { redirect_to user_escrow_url(@escrow), notice: "Escrow was successfully created." }
        format.json { render :show, status: :created, location: @escrow }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @escrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /escrows/1 or /escrows/1.json
  def update
    respond_to do |format|
      if @escrow.update(escrow_params)
        format.html { redirect_to escrow_url(@escrow), notice: "Escrow was successfully updated." }
        format.json { render :show, status: :ok, location: @escrow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @escrow.errors, status: :unprocessable_entity }
      end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escrow
      @escrow = Escrow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def escrow_params
      params.require(:escrow).permit(:role, :payment_for, :payment_amount, :transaction_fees, :user_email, :vendor_email, :invoice)
    end
end
