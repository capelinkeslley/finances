# frozen_string_literal: true

json.extract! deposit, :id, :value, :user_id, :date, :created_at, :updated_at
json.url deposit_url(deposit, format: :json)
