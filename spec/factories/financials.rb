# frozen_string_literal: true

FactoryBot.define do
  factory :financial do
    value { 0.0 }
    user { create(:user) }
  end
end
