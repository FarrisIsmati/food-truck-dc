class Company < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :trucks, dependent: :destroy
  belongs_to :user
end
