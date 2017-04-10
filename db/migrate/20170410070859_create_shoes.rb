class CreateShoes < ActiveRecord::Migration[5.0]
  def change
    create_table :shoes do |t|
      t.string :name
      t.text :description
      t.string :brand
      t.integer :size
      t.integer :unit_price
      t.string :status
      t.references :owner_id, foreign_key: true

      t.timestamps
    end
  end
end
