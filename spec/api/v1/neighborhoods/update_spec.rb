require "rails_helper"

RSpec.describe "neighborhoods#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/neighborhoods/#{neighborhood.id}", payload
  end

  describe "basic update" do
    let!(:neighborhood) { create(:neighborhood) }

    let(:payload) do
      {
        data: {
          id: neighborhood.id.to_s,
          type: "neighborhoods",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(NeighborhoodResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { neighborhood.reload.attributes }
    end
  end
end
