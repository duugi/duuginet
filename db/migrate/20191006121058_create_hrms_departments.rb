class CreateHrmsDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :hrms_departments do |t|
      t.string :name
      t.string :description
      t.integer :leave_allow_count
      t.integer :max_ppl_absent
      t.integer :max_absent_length

      t.timestamps
    end
  end
end
