# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/deposits', type: :request do
  let(:user) { create(:user) }
  let(:valid_attributes) do
    attributes_for(:deposit)
  end
  let(:invalid_attributes) do
    attributes_for(:deposit, date: 1.days.after)
  end
  let(:deposit) do
    create(:deposit, user:)
  end

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get deposits_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get deposit_url(deposit)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_deposit_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Deposit' do
        expect do
          post deposits_url, params: { deposit: valid_attributes }
        end.to change(Deposit, :count).by(1)
      end

      it 'redirects to the created deposit' do
        post deposits_url, params: { deposit: valid_attributes }

        expect(response).to redirect_to(deposit_url(Deposit.last))
      end

      it 'creates new Financial' do
        expect do
          post deposits_url, params: { deposit: valid_attributes }
        end.to change(Financial, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Deposit' do
        expect do
          post deposits_url, params: { deposit: invalid_attributes }
        end.to change(Deposit, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post deposits_url, params: { deposit: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'creates a new Financial' do
        expect do
          post deposits_url, params: { deposit: invalid_attributes }

        end.to change(Financial, :count).by(1)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested deposit' do
      expect do
        delete deposit_url(deposit)
      end.to change(Deposit, :count).by(0)
    end

    it 'redirects to the deposits list' do
      delete deposit_url(deposit)
      expect(response).to redirect_to(deposits_url)
    end

    it 'update financial value for 0' do
      delete deposit_url(deposit)

      user.reload

      expect(user.financial.value).to eq(0)
    end
  end
end
