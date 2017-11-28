class AddLatLongAddressFieldToTrucks < ActiveRecord::Migration[5.1]
  def change
    add_column :trucks, :lat, :float
    add_column :trucks, :long, :float
    add_column :trucks, :address, :string
  end
end
