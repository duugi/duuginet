class Hrms::Position < ApplicationRecord
  belongs_to :department

  validates :name, presence: true
end
