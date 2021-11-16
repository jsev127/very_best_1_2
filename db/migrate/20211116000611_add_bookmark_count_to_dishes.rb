class AddBookmarkCountToDishes < ActiveRecord::Migration[6.0]
  def change
    add_column :dishes, :bookmarks_count, :integer
  end
end
