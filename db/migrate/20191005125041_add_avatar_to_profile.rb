class AddAvatarToProfile < ActiveRecord::Migration[5.2]
  def change
    add_attachment :profiles, :avatar
  end
end
