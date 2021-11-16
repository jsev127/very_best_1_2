require "rails_helper"

RSpec.describe "dishes#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/dishes", params: params
  end

  describe "basic fetch" do
    let!(:dish1) { create(:dish) }
    let!(:dish2) { create(:dish) }

    it "works" do
      expect(DishResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["dishes"])
      expect(d.map(&:id)).to match_array([dish1.id, dish2.id])
    end
  end
end
