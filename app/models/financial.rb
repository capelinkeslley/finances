# frozen_string_literal: true

class Financial < ApplicationRecord
  belongs_to :user

  validates :month, :year, presence: true
end
