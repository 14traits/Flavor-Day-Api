class FlavorsController < ApplicationController
  def index
    @flavors = Flavor.all
    render :index
  end

  def show
    @flavor = Flavor.find_by(id: params["id"])
    render template: "locations/show"
  end

  def create
    @flavor = Flavor.new(
      name: params["name"],
      image_url: params["image_url"],
      cf_id: params["cf_id"],
    )

    @flavor.save
    render :show
  end
end
