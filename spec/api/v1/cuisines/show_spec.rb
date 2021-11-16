require "rails_helper"

RSpec.describe "cuisines#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/cuisines/#{cuisine.id}", params: params
  end

  describe "basic fetch" do
    let!(:cuisine) { create(:cuisine) }

    it "works" do
      expect(CuisineResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("cuisines")
      expect(d.id).to eq(cuisine.id)
    end
  end
end
