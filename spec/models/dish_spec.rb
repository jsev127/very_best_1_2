require 'rails_helper'

RSpec.describe Dish, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:bookmarks) }

    it { should belong_to(:cuisine) }

    end

    describe "InDirect Associations" do

    it { should have_many(:fans) }

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:name) }

    it { should validate_presence_of(:name) }

    end
end
