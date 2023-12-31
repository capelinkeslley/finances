# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
  end

  describe 'relationships' do
    it { should have_one(:financial) }
    it { should have_many(:deposits) }
    it { should have_many(:outflows) }
  end
end
