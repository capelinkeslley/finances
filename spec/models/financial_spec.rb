# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Financial, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
  end
end
