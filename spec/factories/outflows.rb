# frozen_string_literal: true

FactoryBot.define do
  factory :outflow do
    value { '9.99' }
    user { nil }
    date { '2023-10-14 16:19:00' }
  end
end
