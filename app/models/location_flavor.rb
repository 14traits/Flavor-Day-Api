class LocationFlavor < ApplicationRecord
  belongs_to :flavor
  belongs_to :location
  validates :location_id, uniqueness: true
end
