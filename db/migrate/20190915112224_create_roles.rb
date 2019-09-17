class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :order
      t.string :app

      t.timestamps
    end

    add_column :roles, :parent_id, :integer, null: true, index: true
    add_foreign_key :roles, :roles, column: :parent_id
  end
end
