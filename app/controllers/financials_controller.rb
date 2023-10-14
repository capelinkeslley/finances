# frozen_string_literal: true

class FinancialsController < ApplicationController
  before_action :set_financial, only: :show

  def index
    @financials = current_user.financials
  end

  def show; end

  private

  def set_financial
    @financial = current_user.financials.find(params[:id])
  end
end
