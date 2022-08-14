Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :images, defaults: { format: :json }

  # Gets
  get "/locations" => "locations#index"
  get "/locations/:id", controller: "locations", action: "show"
  get "/flavors" => "flavors#index"
  get "/flavors/:id" => "flavors#show"

  # Posts
  post "/locations" => "locations#create"
  post "/flavors" => "flavors#create"

  # # Patch
  # patch "/locations/:id" => "locations#update"
  # patch "/flavors/:id" => "flavors#update"

  # # Delete
  # delete "/locations/:id" => "locations#destroy"
  # delete "/flavors/:id" => "flavors#destroy"
end
