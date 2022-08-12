class CreateFlavors < ActiveRecord::Migration[7.0]
  def change
    create_table :flavors do |t|
      t.string :name
      t.integer :cf_id
      t.string :image_url

      t.timestamps
    end
  end
end
