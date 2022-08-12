class Location < ApplicationRecord
  has_many :location_flavors, foreign_key: "location_id", class_name: "LocationFlavor"
  has_many :flavors, through: :location_flavors

  # def image_url
  #   # image_url = :flavors.image_url.where(location_id: id)
  #   image_url = Flavors.image_url.where(location_id: id)
  #   # image_url.where(location_id: id)
  # end

  # def name
  #   name = :flavors[name].where(flavor_id: id)
  # end
end
