class Venue < ApplicationRecord
  # Direct associations

  belongs_to :neighborhood,
             :counter_cache => true

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  has_many   :specialties,
             :through => :bookmarks,
             :source => :dish

  # Validations

  validates :name, :uniqueness => { :scope => [:neighborhood_id], :message => "already exists" }

  validates :name, :presence => true

  # Scopes

  def to_s
    name
  end

end
