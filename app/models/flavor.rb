class Flavor < ApplicationRecord
  has_many :location_flavors
  has_many :locations, through: :location_flavors

  def load_data(data)
    i = 0
    data["response"]["collection"].each do
      Flavor.create!(name: data["response"]["collection"][i]["flavor_day"],
                     image_url: data["response"]["collection"][i]["flavor_image2"],
                     cf_id: data["response"]["collection"][i]["flavor_id"])
      i += 1
    end
  end
end
