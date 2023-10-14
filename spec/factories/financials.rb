# frozen_string_literal: true

FactoryBot.define do
  factory :financial do
    month { 'january' }
    year { '2023' }
    value { 0.0 }
    user { create(:user) }
  end
end
