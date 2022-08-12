class Flavor < ApplicationRecord
  has_many :location_flavors
  has_many :locations, through: :location_flavors
end
