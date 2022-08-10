class LocationFlavor < ApplicationRecord
  belongs_to :flavors
  belongs_to :locations
end
