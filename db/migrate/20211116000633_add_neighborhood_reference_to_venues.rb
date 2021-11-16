class AddNeighborhoodReferenceToVenues < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :venues, :neighborhoods
    add_index :venues, :neighborhood_id
    change_column_null :venues, :neighborhood_id, false
  end
end
