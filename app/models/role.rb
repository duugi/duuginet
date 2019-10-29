class Role < ApplicationRecord
  include Filterable

  has_many :permittables
  has_many :permissions, through: :permittables
  has_many :users

  validates :name, presence: true, uniqueness: true
end
