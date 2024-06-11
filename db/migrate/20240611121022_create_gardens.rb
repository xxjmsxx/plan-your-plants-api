class CreateGardens < ActiveRecord::Migration[7.1]
  def change
    create_table :gardens do |t|
      t.string :name
      t.string :location
      t.integer :size
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
