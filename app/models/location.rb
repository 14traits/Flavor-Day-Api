class Location < ApplicationRecord
  has_many :locations_flavors
  has_many :flavors, through: :location_flavors
end
