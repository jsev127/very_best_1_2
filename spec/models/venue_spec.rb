require 'rails_helper'

RSpec.describe Venue, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:name).scoped_to(:neighborhood_id).with_message('already exists') }

    it { should validate_presence_of(:name) }

    end
end
