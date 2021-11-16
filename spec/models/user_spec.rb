require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:bookmarks) }

    end

    describe "InDirect Associations" do

    it { should have_many(:bookmarked_venues) }

    it { should have_many(:dishes) }

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:username) }

    it { should validate_presence_of(:username) }

    end
end
