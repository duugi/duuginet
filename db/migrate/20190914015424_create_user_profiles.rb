class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone_number
      t.string :mobile_number
      t.string :gender
      t.date :birth_date
      t.string :identify_number
      t.boolean :is_diffrent_postal
      t.jsonb :address
      t.jsonb :address_postal
      t.jsonb :extra
      t.timestamps
      t.belongs_to :user, index: { unique: true }, foreign_key: true
    end
  end
end
