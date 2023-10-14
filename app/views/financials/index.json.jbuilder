# frozen_string_literal: true

json.array! @financials, partial: 'financials/financial', as: :financial
