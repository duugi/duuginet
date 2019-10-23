class ChangeUserProfilesToProfiles < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_profiles, :profiles
  end
end
