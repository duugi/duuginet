class Permission < ApplicationRecord
  has_many :permittables
  has_many :roles, through: :permittables
end
