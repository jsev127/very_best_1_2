class Bookmark < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :dish_id, :presence => true

  validates :user_id, :presence => true

  validates :venue_id, :uniqueness => { :scope => [:dish_id, :user_id], :message => "has already been bookmarked" }

  validates :venue_id, :presence => true

  # Scopes

  def to_s
    notes
  end

end
