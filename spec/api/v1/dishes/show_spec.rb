require 'rails_helper'

RSpec.describe "dishes#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/dishes/#{dish.id}", params: params
  end

  describe 'basic fetch' do
    let!(:dish) { create(:dish) }

    it 'works' do
      expect(DishResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('dishes')
      expect(d.id).to eq(dish.id)
    end
  end
end
