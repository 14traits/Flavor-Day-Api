require "swagger_helper"

RSpec.describe "api/v1/locations_controller", type: :request do
  path "/api/v1/locations" do
    post "Create an location" do
      tags "Locations"
      consumes "application/json"
      parameter name: :location, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          latitude: { type: :number, format: :float },
          longitude: { type: :number, format: :float },
          title: { type: :string },
          address: { type: :string },
          city: { type: :string },
          state: { type: :string },
          postal_code: { type: :integer },
          cl_id: { type: :integer },
          uid: { type: :integer },
        },
        required: ["title", "postal_code"],
      }
      response "201", "location created" do
        let(:location) { { title: "North Pole", postal_code: "11111" } }
        run_test!
      end
      response "422", "invalid request" do
        let(:location) { { title: "Nope", postal_code: "99999" } }
        run_test!
      end
    end
  end

  path "/api/v1/locations/{id}" do
    get "Retrieves a location" do
      tags "Locations"
      produces "application/json"
      parameter name: :id, :in => :path, :type => :string

      response "200", "name found" do
        schema type: :object,
          properties: {
            id: { type: :integer },
            latitude: { type: :number, format: :float },
            longitude: { type: :number, format: :float },
            title: { type: :string },
            address: { type: :string },
            city: { type: :string },
            state: { type: :string },
            postal_code: { type: :integer },
            cl_id: { type: :integer },
            uid: { type: :integer },
          },
          required: ["title"]

        let(:id) { Locations.create(title: "test", postal_code: "55555").id }
        run_test!
      end

      response "404", "location not found" do
        let(:id) { "invalid" }
        run_test!
      end
    end
  end
end
