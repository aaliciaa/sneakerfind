class AddAvailableToShoes < ActiveRecord::Migration[5.0]
  def change
    add_column :shoes, :available, :boolean, default: true
  end
end
