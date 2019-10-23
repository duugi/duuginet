class AddCategoryIdToLibrary < ActiveRecord::Migration[5.2]
  def change
    add_column :libraries, :category_id, :integer
    add_index  :libraries, :category_id
  end
end
