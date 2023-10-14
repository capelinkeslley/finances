# frozen_string_literal: true

FactoryBot.define do
  factory :deposit do
    value { '9.99' }
    date { 1.minute.ago }
    user { create(:user) }
  end
end
