class AddVenueReferenceToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmarks, :venues
    add_index :bookmarks, :venue_id
    change_column_null :bookmarks, :venue_id, false
  end
end
