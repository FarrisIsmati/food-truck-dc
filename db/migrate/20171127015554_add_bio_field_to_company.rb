class AddBioFieldToCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :bio, :string
  end
end
