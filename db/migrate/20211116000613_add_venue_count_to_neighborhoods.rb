class AddVenueCountToNeighborhoods < ActiveRecord::Migration[6.0]
  def change
    add_column :neighborhoods, :venues_count, :integer
  end
end
