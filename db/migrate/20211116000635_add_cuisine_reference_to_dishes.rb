class AddCuisineReferenceToDishes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :dishes, :cuisines
    add_index :dishes, :cuisine_id
    change_column_null :dishes, :cuisine_id, false
  end
end
