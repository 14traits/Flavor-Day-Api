Flavor.destroy_all
Location.destroy_all
LocationFlavor.destroy_all

Flavor.create!([name: "Snickers Swirl",
                image_url: "https://cdn.culvers.com/menu-item-detail/img-Snicker-Swirl.png?w=120",
                cf_id: "117"])

Location.create!([latitude: "43.1245",
                  longitude: "-87.9129",
                  title: "Culver's of Glendale, WI - W Bayside Dr",
                  address: "300 West Bayside Drive",
                  city: "Glendale",
                  state: "WI",
                  postal_code: "53217",
                  cl_id: "852",
                  uid: "-372087291"])

LocationFlavor.create!([
  {
    flavor_id: "1",
    location_id: "1",
  },
])
