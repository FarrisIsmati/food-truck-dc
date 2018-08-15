class ChangePhoneNumberToString < ActiveRecord::Migration[5.1]
  def change
    change_column :companies, :phone_number, :string
    # Good job storing phone numbers as strings
  end
end
