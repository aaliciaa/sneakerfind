class AddShoePhotoToShoes < ActiveRecord::Migration[5.0]
  def change
    add_column :shoes, :photo, :string
  end
end
