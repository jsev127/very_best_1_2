require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:user_id) }

    it { should validate_uniqueness_of(:venue_id).scoped_to(:dish_id).scoped_to(:user_id).with_message('has already been bookmarked') }

    it { should validate_presence_of(:venue_id) }

    end
end
