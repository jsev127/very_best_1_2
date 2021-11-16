require "rails_helper"

RSpec.describe "venues#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/venues", params: params
  end

  describe "basic fetch" do
    let!(:venue1) { create(:venue) }
    let!(:venue2) { create(:venue) }

    it "works" do
      expect(VenueResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["venues"])
      expect(d.map(&:id)).to match_array([venue1.id, venue2.id])
    end
  end
end
