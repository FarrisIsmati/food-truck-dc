class Truck < ApplicationRecord
  belongs_to :company
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
