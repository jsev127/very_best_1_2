require 'rails_helper'

RSpec.describe VenueResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'venues',
          attributes: { }
        }
      }
    end

    let(:instance) do
      VenueResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Venue.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:venue) { create(:venue) }

    let(:payload) do
      {
        data: {
          id: venue.id.to_s,
          type: 'venues',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      VenueResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { venue.reload.updated_at }
      # .and change { venue.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:venue) { create(:venue) }

    let(:instance) do
      VenueResource.find(id: venue.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Venue.count }.by(-1)
    end
  end
end
