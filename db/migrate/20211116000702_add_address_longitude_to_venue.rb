class AddAddressLongitudeToVenue < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :address_longitude, :float
  end
end
