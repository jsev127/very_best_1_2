require 'rails_helper'

RSpec.describe "cuisines#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/cuisines", params: params
  end

  describe 'basic fetch' do
    let!(:cuisine1) { create(:cuisine) }
    let!(:cuisine2) { create(:cuisine) }

    it 'works' do
      expect(CuisineResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['cuisines'])
      expect(d.map(&:id)).to match_array([cuisine1.id, cuisine2.id])
    end
  end
end
