class Venue < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :uniqueness => { :scope => [:neighborhood_id], :message => "already exists" }

  validates :name, :presence => true

  # Scopes

  def to_s
    name
  end

end
