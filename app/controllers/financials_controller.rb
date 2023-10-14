# frozen_string_literal: true

class FinancialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_financial, only: :show

  def index
    @financial = current_user.financial
  end

  def show; end

  private

  def set_financial
    @financial = current_user.financial
  end
end
