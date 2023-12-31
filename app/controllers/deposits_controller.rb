# frozen_string_literal: true

class DepositsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deposit, only: %i[show destroy]
  before_action :set_financial, only: %i[create destroy]

  # GET /deposits or /deposits.json
  def index
    @deposits = current_user.deposits
  end

  # GET /deposits/1 or /deposits/1.json
  def show; end

  # GET /deposits/new
  def new
    @deposit = Deposit.new
  end

  # POST /deposits or /deposits.json
  def create
    @deposit = Deposit.new(deposit_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @deposit.save
        format.html { redirect_to deposit_url(@deposit), notice: 'Deposit was successfully created.' }
        format.json { render :show, status: :created, location: @deposit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deposit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deposits/1 or /deposits/1.json
  def destroy
    value = @deposit.value

    @deposit.destroy

    @financial.update!(value: @financial.value - value)

    respond_to do |format|
      format.html { redirect_to deposits_url, notice: 'Deposit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deposit
    @deposit = current_user.deposits.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def deposit_params
    params.require(:deposit).permit(:value, :user_id, :date)
  end

  def set_financial
    @financial = Financial.find_or_create_by!(user_id: current_user.id)
  end
end
