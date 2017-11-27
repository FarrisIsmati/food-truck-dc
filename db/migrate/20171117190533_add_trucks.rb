class AddTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :trucks do |t|
      t.string  :name, null: false

      t.timestamps
    end
  end
end
