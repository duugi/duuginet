class CreateBackendLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :backend_locations do |t|
      t.string :name
      t.string :country_code
      t.string :description
      t.string :state_code
      t.string :timezone_code
      t.boolean :is_active

      t.timestamps
    end
  end
end
