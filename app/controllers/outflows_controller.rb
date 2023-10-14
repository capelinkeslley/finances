# frozen_string_literal: true

class OutflowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_outflow, only: %i[show destroy]
  before_action :set_financial, only: %i[create destroy]

  # GET /outflows or /outflows.json
  def index
    @outflows = current_user.outflows
  end

  # GET /outflows/1 or /outflows/1.json
  def show; end

  # GET /outflows/new
  def new
    @outflow = Outflow.new
  end

  # POST /outflows or /outflows.json
  def create
    @outflow = Outflow.new(outflow_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @outflow.save
        format.html { redirect_to outflow_url(@outflow), notice: 'Outflow was successfully created.' }
        format.json { render :show, status: :created, location: @outflow }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @outflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outflows/1 or /outflows/1.json
  def destroy
    value = @outflow.value

    @outflow.destroy

    @financial.update!(value: @financial.value + value)

    respond_to do |format|
      format.html { redirect_to outflows_url, notice: 'Outflow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_outflow
    @outflow = current_user.outflows.find(params[:id])
  end

  def outflow_params
    params.require(:outflow).permit(:value, :user_id, :date)
  end

  def set_financial
    @financial = Financial.find_or_create_by!(user_id: current_user.id)
  end
end
