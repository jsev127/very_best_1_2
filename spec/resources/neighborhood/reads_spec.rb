require 'rails_helper'

RSpec.describe NeighborhoodResource, type: :resource do
  describe 'serialization' do
    let!(:neighborhood) { create(:neighborhood) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(neighborhood.id)
      expect(data.jsonapi_type).to eq('neighborhoods')
    end
  end

  describe 'filtering' do
    let!(:neighborhood1) { create(:neighborhood) }
    let!(:neighborhood2) { create(:neighborhood) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: neighborhood2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([neighborhood2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:neighborhood1) { create(:neighborhood) }
      let!(:neighborhood2) { create(:neighborhood) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            neighborhood1.id,
            neighborhood2.id
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
            neighborhood2.id,
            neighborhood1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
