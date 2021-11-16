require "rails_helper"

RSpec.describe "neighborhoods#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/neighborhoods/#{neighborhood.id}", params: params
  end

  describe "basic fetch" do
    let!(:neighborhood) { create(:neighborhood) }

    it "works" do
      expect(NeighborhoodResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("neighborhoods")
      expect(d.id).to eq(neighborhood.id)
    end
  end
end
