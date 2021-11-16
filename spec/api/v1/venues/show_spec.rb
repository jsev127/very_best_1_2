require "rails_helper"

RSpec.describe "venues#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/venues/#{venue.id}", params: params
  end

  describe "basic fetch" do
    let!(:venue) { create(:venue) }

    it "works" do
      expect(VenueResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("venues")
      expect(d.id).to eq(venue.id)
    end
  end
end
