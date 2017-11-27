class AddCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :website
      t.boolean :credit_card
      t.string :profile_img
      t.integer :phone_number
      
      t.timestamps
    end
  end
end
