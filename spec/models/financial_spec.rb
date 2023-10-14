# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Financial, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:month) }
    it { should validate_presence_of(:year) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
  end
end
