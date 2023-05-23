class Asset < ApplicationRecord
  has_many :day_schedules

  validates :name, presence: true, uniqueness: true
  # any other logic or validations...
end
