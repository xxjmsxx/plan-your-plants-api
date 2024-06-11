class CreatePlants < ActiveRecord::Migration[7.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.text :description
      t.integer :water_amount
      t.date :bloom
      t.string :weather_preference
      t.string :sunlight
      t.string :soil_type

      t.timestamps
    end
  end
end
