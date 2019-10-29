class Hrms::Department < ApplicationRecord
  has_many :position

  validates :name, presence: true
end
