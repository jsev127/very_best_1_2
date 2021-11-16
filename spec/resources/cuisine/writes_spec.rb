require 'rails_helper'

RSpec.describe CuisineResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'cuisines',
          attributes: { }
        }
      }
    end

    let(:instance) do
      CuisineResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Cuisine.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:cuisine) { create(:cuisine) }

    let(:payload) do
      {
        data: {
          id: cuisine.id.to_s,
          type: 'cuisines',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      CuisineResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { cuisine.reload.updated_at }
      # .and change { cuisine.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:cuisine) { create(:cuisine) }

    let(:instance) do
      CuisineResource.find(id: cuisine.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Cuisine.count }.by(-1)
    end
  end
end
