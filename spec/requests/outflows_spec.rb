# frozen_string_literal: true

require 'rails_helper'



RSpec.describe '/outflows', type: :request do
  let(:user) { create(:user) }
  let(:outflow) { create(:outflow, user:) }
  let(:valid_attributes) do
    attributes_for(:outflow)
  end
  let(:invalid_attributes) do
    attributes_for(:outflow, date: 1.minute.after)
  end

  before do
    sign_in user
  end

  describe 'GET /index' do
    let!(:outflow) { create(:outflow, user:) }

    it 'renders a successful response' do
      get outflows_url

      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get outflow_url(outflow)

      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_outflow_url

      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Outflow' do
        expect do
          post outflows_url, params: { outflow: valid_attributes }
        end.to change(Outflow, :count).by(1)
      end

      it 'redirects to the created outflow' do
        post outflows_url, params: { outflow: valid_attributes }
        expect(response).to redirect_to(outflow_url(Outflow.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Outflow' do
        expect do
          post outflows_url, params: { outflow: invalid_attributes }
        end.to change(Outflow, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post outflows_url, params: { outflow: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested outflow' do
      expect do
        delete outflow_url(outflow)
      end.to change(Outflow, :count).by(0)
    end

    it 'redirects to the outflows list' do
      delete outflow_url(outflow)

      expect(response).to redirect_to(outflows_url)
    end
  end
end
