require "rails_helper"

RSpec.describe "neighborhoods#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/neighborhoods/#{neighborhood.id}"
  end

  describe "basic destroy" do
    let!(:neighborhood) { create(:neighborhood) }

    it "updates the resource" do
      expect(NeighborhoodResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Neighborhood.count }.by(-1)
      expect { neighborhood.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
