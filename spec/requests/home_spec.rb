require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /leading_page" do
    it "returns http success" do
      get "/home/leading_page"
      expect(response).to have_http_status(:success)
    end
  end

end
