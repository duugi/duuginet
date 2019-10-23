class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :post_comment, dependent: :destroy
  belongs_to :user
end
