class LocationFlavorsController < ApplicationController
  # def index
  #   @location_flavors = Location_flavor.all
  #   render :index.as_json
  # end

  # def show
  #   @location_flavor = Location_flavor.find_by(id: params["id"])
  #   render template: "location_flavors/show"
  # end

  def create
    @location_flavor = Location_flavor.new(
      location_id: params["location_id"],
      flavor_id: params["flavor_id"],
    )

    @location_flavor.save
    render :show
  end
end
