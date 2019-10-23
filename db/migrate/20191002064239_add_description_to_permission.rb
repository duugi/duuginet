class AddDescriptionToPermission < ActiveRecord::Migration[5.2]
  def change
    add_column :permissions, :description, :string
  end
end
