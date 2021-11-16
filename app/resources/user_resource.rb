class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string

  # Direct associations

  has_many   :bookmarks

  # Indirect associations

  many_to_many :bookmarked_venues,
               resource: VenueResource

  many_to_many :dishes

end
