# frozen_string_literal: true

json.array! @outflows, partial: 'outflows/outflow', as: :outflow
