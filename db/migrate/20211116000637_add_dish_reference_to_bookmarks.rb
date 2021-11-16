class AddDishReferenceToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmarks, :dishes
    add_index :bookmarks, :dish_id
    change_column_null :bookmarks, :dish_id, false
  end
end
