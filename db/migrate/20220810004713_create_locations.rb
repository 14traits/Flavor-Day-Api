class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.float :latitude, :precision => 10, :scale => 6
      t.float :longitude, :precision => 10, :scale => 6
      t.string :title
      t.text :address
      t.string :city
      t.string :state
      t.integer :postal_code
      t.integer :cl_id
      t.integer :uid

      t.timestamps
    end
  end
end
