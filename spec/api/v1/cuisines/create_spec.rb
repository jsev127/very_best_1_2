require "rails_helper"

RSpec.describe "cuisines#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/cuisines", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "cuisines",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(CuisineResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { Cuisine.count }.by(1)
    end
  end
end
