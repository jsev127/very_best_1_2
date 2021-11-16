require "rails_helper"

RSpec.describe "dishes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/dishes/#{dish.id}", payload
  end

  describe "basic update" do
    let!(:dish) { create(:dish) }

    let(:payload) do
      {
        data: {
          id: dish.id.to_s,
          type: "dishes",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(DishResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { dish.reload.attributes }
    end
  end
end
