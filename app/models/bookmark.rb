class Bookmark < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :venue_id, :presence => true

  # Scopes

  def to_s
    notes
  end

end
