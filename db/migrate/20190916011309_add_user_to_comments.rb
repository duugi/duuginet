class AddUserToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :post_comments, :user, foreign_key: true
  end
end
