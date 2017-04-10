class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
      t.date :start_date
      t.date :end_date
      t.integer :total_cost
      t.string :status
      t.references :shoe, foreign_key: true
      t.integer :renter_id

      t.timestamps
    end
    add_foreign_key :rentals, :users, column: :renter_id
    add_index :rentals, :renter_id
  end
end
