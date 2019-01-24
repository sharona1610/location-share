class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.boolean :public
      t.float :latitude
      t.float :longitude
      t.string :name
      t.references :creator
      t.timestamps
    end
  end
end
