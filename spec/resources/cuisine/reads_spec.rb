require 'rails_helper'

RSpec.describe CuisineResource, type: :resource do
  describe 'serialization' do
    let!(:cuisine) { create(:cuisine) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(cuisine.id)
      expect(data.jsonapi_type).to eq('cuisines')
    end
  end

  describe 'filtering' do
    let!(:cuisine1) { create(:cuisine) }
    let!(:cuisine2) { create(:cuisine) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: cuisine2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([cuisine2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:cuisine1) { create(:cuisine) }
      let!(:cuisine2) { create(:cuisine) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            cuisine1.id,
            cuisine2.id
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
            cuisine2.id,
            cuisine1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
