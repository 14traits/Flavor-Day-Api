class CreateLocationFlavors < ActiveRecord::Migration[7.0]
  def change
    create_table :location_flavors do |t|
      t.integer :location_id
      t.integer :flavor_id

      t.timestamps
    end
  end
end
