class Location < ApplicationRecord
  has_many :location_flavors
  has_many :flavors, through: :location_flavors
  validates :cl_id, uniqueness: true, presence: true, numericality: { greater_than: 0 }
end
