require 'rails_helper'

RSpec.describe DishResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'dishes',
          attributes: { }
        }
      }
    end

    let(:instance) do
      DishResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Dish.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:dish) { create(:dish) }

    let(:payload) do
      {
        data: {
          id: dish.id.to_s,
          type: 'dishes',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      DishResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { dish.reload.updated_at }
      # .and change { dish.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:dish) { create(:dish) }

    let(:instance) do
      DishResource.find(id: dish.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Dish.count }.by(-1)
    end
  end
end
