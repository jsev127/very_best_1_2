require "rails_helper"

RSpec.describe Bookmark, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:dish) }

    it { should belong_to(:venue) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:dish_id) }

    it { should validate_presence_of(:user_id) }

    it {
      should validate_uniqueness_of(:venue_id).scoped_to(:dish_id).scoped_to(:user_id).with_message("has already been bookmarked")
    }

    it { should validate_presence_of(:venue_id) }
  end
end
