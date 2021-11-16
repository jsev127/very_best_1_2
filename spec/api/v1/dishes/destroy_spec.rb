require 'rails_helper'

RSpec.describe "dishes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/dishes/#{dish.id}"
  end

  describe 'basic destroy' do
    let!(:dish) { create(:dish) }

    it 'updates the resource' do
      expect(DishResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Dish.count }.by(-1)
      expect { dish.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
