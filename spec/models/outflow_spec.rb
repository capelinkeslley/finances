# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Outflow, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_one(:financial).through(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:date) }

    context 'when date is in the past' do
      let(:deposit) { build(:deposit, date: 1.day.ago) }

      it 'is valid' do
        expect(deposit).to be_valid
      end
    end

    context 'when date is now' do
      let(:deposit) { build(:deposit, date: Time.now) }

      it 'is valid' do
        expect(deposit).to be_valid
      end
    end

    context 'when date is the future' do
      let(:deposit) { build(:deposit, date: 1.minute.after) }

      it 'is invalid' do
        expect(deposit).to be_invalid
      end
    end
  end
end
