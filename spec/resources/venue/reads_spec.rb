require 'rails_helper'

RSpec.describe VenueResource, type: :resource do
  describe 'serialization' do
    let!(:venue) { create(:venue) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(venue.id)
      expect(data.jsonapi_type).to eq('venues')
    end
  end

  describe 'filtering' do
    let!(:venue1) { create(:venue) }
    let!(:venue2) { create(:venue) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: venue2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([venue2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:venue1) { create(:venue) }
      let!(:venue2) { create(:venue) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            venue1.id,
            venue2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            venue2.id,
            venue1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
