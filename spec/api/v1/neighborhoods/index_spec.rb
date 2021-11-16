require "rails_helper"

RSpec.describe "neighborhoods#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/neighborhoods", params: params
  end

  describe "basic fetch" do
    let!(:neighborhood1) { create(:neighborhood) }
    let!(:neighborhood2) { create(:neighborhood) }

    it "works" do
      expect(NeighborhoodResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["neighborhoods"])
      expect(d.map(&:id)).to match_array([neighborhood1.id, neighborhood2.id])
    end
  end
end
