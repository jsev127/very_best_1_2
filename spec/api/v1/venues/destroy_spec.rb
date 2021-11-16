require "rails_helper"

RSpec.describe "venues#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/venues/#{venue.id}"
  end

  describe "basic destroy" do
    let!(:venue) { create(:venue) }

    it "updates the resource" do
      expect(VenueResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Venue.count }.by(-1)
      expect { venue.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
