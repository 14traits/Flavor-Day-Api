class LocationsController < ApplicationController
  def index
    # array = Array.new
    @locations = Location.all
    render template: "locations/index"
  end

  def find_location
    location = Location.find_by(id: params["id"])
    render template: "locations/show"
  end

  def create
    @location = Location.new(
      latitude: params["latitude"],
      longitude: params["longitude"],
      title: params["title"],
      address: params["address"],
      city: params["city"],
      state: params["state"],
      postal_code: params["postal_code"],
      cl_id: params["cl_id"],
      uid: params["uid"],
    )
    if @location.save
      render template: "locations/show"
    else
      render json: { errors: location.errors.full_messages }, status: 418
    end
  end

  def update
    @location = Location.find_by(id: params["id"])

    @location.latitude = params["latitude"] || @location.latitude
    @location.longitude = params["longitude"] || @location.longitude
    @location.title = params["title"] || @location.title
    @location.address = params["address"] || @location.address
    @location.city = params["city"] || @location.city
    @location.state = params["state"] || @location.state
    @location.postal_code = params["postal_code"] || @location.postal_code
    @location.cl_id = params["cl_id"] || @location.cl_id
    @location.uid = params["uid"] || @location.uid

    if @location.save
      render template: "locations/show"
    else
      render json: { errors: location.errors.full_messages }
    end
  end

  def destroy
    location = Location.find_by(id: params["id"])
    location.destroy
    render json: { message: "Location was deleted!" }
  end
end
