class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :slug
      t.string :description
      t.boolean :is_active

      t.timestamps
    end
  end
end
