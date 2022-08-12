class LocationFlavor < ApplicationRecord
  belongs_to :flavors, class_name: "Flavor"
  belongs_to :locations, class_name: "Location"
end
