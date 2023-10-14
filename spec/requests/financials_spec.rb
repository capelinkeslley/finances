# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/financials', type: :request do
  let(:user) { create(:user) }
  let!(:financial) { create(:financial, user:) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get financials_url

      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get financial_url(financial)

      expect(response).to be_successful
    end
  end
end
