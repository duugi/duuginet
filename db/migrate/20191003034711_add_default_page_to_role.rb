class AddDefaultPageToRole < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :default_page, :string
  end
end
