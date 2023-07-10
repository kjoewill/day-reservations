class DaySchedule < ApplicationRecord
  belongs_to :asset
  has_many :reservations, dependent: :destroy

  validates :day, presence: true
  validates :asset, presence: true
end
