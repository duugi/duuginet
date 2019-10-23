class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :module
      t.string :description
      t.boolean :is_active

      t.timestamps
    end
  end
end
