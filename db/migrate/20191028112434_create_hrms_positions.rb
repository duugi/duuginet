class CreateHrmsPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :hrms_positions do |t|
      t.string :name
      t.string :description
      t.belongs_to :department

      t.timestamps
    end
  end
end
