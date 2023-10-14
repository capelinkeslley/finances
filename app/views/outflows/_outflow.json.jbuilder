# frozen_string_literal: true

json.extract! outflow, :id, :value, :user_id, :date, :created_at, :updated_at
json.url outflow_url(outflow, format: :json)
