require 'rails_helper'

RSpec.describe Venue, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:neighborhood) }

    it { should have_many(:bookmarks) }

    end

    describe "InDirect Associations" do

    it { should have_many(:fans) }

    it { should have_many(:specialties) }

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:name).scoped_to(:neighborhood_id).with_message('already exists') }

    it { should validate_presence_of(:name) }

    end
end
