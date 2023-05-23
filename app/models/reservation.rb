class Reservation < ApplicationRecord
  TIME_SLOTS = %w[08:30 09:00 09:30 10:00 10:30 11:00]

  belongs_to :day_schedule
  
  validates :time_slot, inclusion: { in: TIME_SLOTS }
  validates :description, presence: true
  validates :day_schedule, presence: true
  # additional validations and methods...
end
