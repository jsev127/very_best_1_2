require 'rails_helper'

RSpec.describe NeighborhoodResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'neighborhoods',
          attributes: { }
        }
      }
    end

    let(:instance) do
      NeighborhoodResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Neighborhood.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:neighborhood) { create(:neighborhood) }

    let(:payload) do
      {
        data: {
          id: neighborhood.id.to_s,
          type: 'neighborhoods',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      NeighborhoodResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { neighborhood.reload.updated_at }
      # .and change { neighborhood.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:neighborhood) { create(:neighborhood) }

    let(:instance) do
      NeighborhoodResource.find(id: neighborhood.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Neighborhood.count }.by(-1)
    end
  end
end
