# frozen_string_literal: true

json.extract! financial, :id, :month, :year, :value, :created_at, :updated_at
json.url financial_url(financial, format: :json)
