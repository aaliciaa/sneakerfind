class CreateShoes < ActiveRecord::Migration[5.0]
  def change
    create_table :shoes do |t|
      t.string :name
      t.text :description
      t.string :brand
      t.integer :size
      t.integer :unit_price
      t.string :status
      # t.references :user, foreign_key: true
      t.integer :owner_id

      t.timestamps
    end

    add_foreign_key :shoes, :users, column: :owner_id
    add_index :shoes, :owner_id
  end
end
