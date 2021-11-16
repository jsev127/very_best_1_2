require 'rails_helper'

RSpec.describe "cuisines#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/cuisines/#{cuisine.id}"
  end

  describe 'basic destroy' do
    let!(:cuisine) { create(:cuisine) }

    it 'updates the resource' do
      expect(CuisineResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Cuisine.count }.by(-1)
      expect { cuisine.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
