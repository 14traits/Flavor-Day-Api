class Location < ApplicationRecord
  has_many :location_flavors
  has_many :flavors, through: :location_flavors
  validates :cl_id, uniqueness: true
end
