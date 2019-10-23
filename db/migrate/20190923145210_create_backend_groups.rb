class CreateBackendGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :backend_groups do |t|
      t.string :name
      t.string :description
      t.boolean :is_active
      t.boolean :is_public

      t.timestamps
    end
  end
end
