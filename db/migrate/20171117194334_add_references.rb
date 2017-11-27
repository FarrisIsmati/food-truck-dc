class AddReferences < ActiveRecord::Migration[5.1]
  def change
    add_reference :companies, :user, foreign_key: true
    add_reference :comments, :company, foreign_key: true
    add_reference :trucks, :company, foreign_key: true
  end
end
