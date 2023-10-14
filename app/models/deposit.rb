# frozen_string_literal: true

class Deposit < ApplicationRecord
  belongs_to :user
  has_one :financial, through: :user

  validates :value, :date, presence: true
  validate :date_cannot_be_in_the_future

  after_create :update_financials

  private

  def date_cannot_be_in_the_future
    return if date.present? && date <= Time.now

    errors.add(:date, 'não pode ser no futuro')
  end

  def update_financials
    current_financial.update!(value: current_financial.value.to_f + value)
  end

  def current_financial
    @current_financial ||= user.financial || user.create_financial
  end
end
