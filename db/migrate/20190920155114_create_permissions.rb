class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :action
      t.string :subject_class
      t.string :subject_id
      t.string :group_name
      t.boolean :enabled

      t.timestamps
    end

    create_table :permittables, id: false do |t|
      #t.integer :role_id
      #t.integer :permission_id
      t.references :role, index: true, foreign_key: true
      t.references :permission, index: true, foreign_key: true
    end
  end
end
