require 'rails_helper'

RSpec.describe DishResource, type: :resource do
  describe 'serialization' do
    let!(:dish) { create(:dish) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(dish.id)
      expect(data.jsonapi_type).to eq('dishes')
    end
  end

  describe 'filtering' do
    let!(:dish1) { create(:dish) }
    let!(:dish2) { create(:dish) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: dish2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([dish2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:dish1) { create(:dish) }
      let!(:dish2) { create(:dish) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            dish1.id,
            dish2.id
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
            dish2.id,
            dish1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
