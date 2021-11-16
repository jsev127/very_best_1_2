class AddAddressFormattedAddressToVenue < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :address_formatted_address, :string
  end
end
