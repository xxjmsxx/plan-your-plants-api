class CreateGardenPlants < ActiveRecord::Migration[7.1]
  def change
    create_table :garden_plants do |t|
      t.references :plant, null: false, foreign_key: true
      t.references :garden, null: false, foreign_key: true
      t.references :fertilizer, null: false, foreign_key: true
      t.timestamp :last_watered
      t.timestamp :last_fertilized
      t.integer :health
      t.text :notes

      t.timestamps
    end
  end
end
