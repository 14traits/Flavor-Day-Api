class LocationFlavorsController < ApplicationController
  def index
    @location_flavors = LocationFlavor.all
    render :index.as_json
  end

  # def show
  #   @location_flavor = LocationFlavor.find_by(id: params["id"])
  #   render template: "location_flavors/show"
  # end

  def create
    @location_flavor = LocationFlavor.new(
      location_id: params["location_id"],
      flavor_id: params["flavor_id"],
    )

    if @location_flavor.save
      render json: { message: "success" }
    else
      render json: { errors: @location_flavor.errors.full_messages }
    end
  end
end
