require 'rails_helper'

RSpec.describe "neighborhoods#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/neighborhoods", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'neighborhoods',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(NeighborhoodResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Neighborhood.count }.by(1)
    end
  end
end
