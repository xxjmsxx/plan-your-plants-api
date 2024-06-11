class CreateFertilizers < ActiveRecord::Migration[7.1]
  def change
    create_table :fertilizers do |t|
      t.string :name
      t.text :description
      t.string :type
      t.string :nutrient_ratio

      t.timestamps
    end
  end
end
