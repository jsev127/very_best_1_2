require 'rails_helper'

RSpec.describe "venues#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/venues/#{venue.id}", payload
  end

  describe 'basic update' do
    let!(:venue) { create(:venue) }

    let(:payload) do
      {
        data: {
          id: venue.id.to_s,
          type: 'venues',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(VenueResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { venue.reload.attributes }
    end
  end
end
