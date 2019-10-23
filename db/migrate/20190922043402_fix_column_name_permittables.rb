class FixColumnNamePermittables < ActiveRecord::Migration[5.2]
  def change
     rename_column :permittables, :roles_id, :role_id
     rename_column :permittables, :permissions_id, :permission_id
  end
end
