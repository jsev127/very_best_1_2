require 'rails_helper'

RSpec.describe "cuisines#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/cuisines/#{cuisine.id}", payload
  end

  describe 'basic update' do
    let!(:cuisine) { create(:cuisine) }

    let(:payload) do
      {
        data: {
          id: cuisine.id.to_s,
          type: 'cuisines',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(CuisineResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { cuisine.reload.attributes }
    end
  end
end
