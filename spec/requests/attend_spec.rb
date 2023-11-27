require 'rails_helper'

RSpec.describe "Attends", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/attend/index"
      expect(response).to have_http_status(:success)
    end
  end
end
