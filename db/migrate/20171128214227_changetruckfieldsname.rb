class Changetruckfieldsname < ActiveRecord::Migration[5.1]
  def change
    rename_column :trucks, :lat, :latitude
    rename_column :trucks, :long, :longitude
  end
end
