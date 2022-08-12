class Flavor < ApplicationRecord
  has_many :location_flavors, foreign_key: "flavor_id", class_name: "LocationFlavor"
  has_many :locations, through: :location_flavors
end
