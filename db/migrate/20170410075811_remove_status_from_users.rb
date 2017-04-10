class RemoveStatusFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :shoes, :status, :string
  end
end
