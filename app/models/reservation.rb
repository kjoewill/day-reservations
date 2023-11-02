class Reservation < ApplicationRecord
  TIME_SLOTS = %w[09:00 09:30 10:00 10:30 11:00 11:30 12:00 12:30 13:00 13:30 14:00 14:30 15:00 15:30 16:00 16:30]

  belongs_to :day_schedule
  
  validates :time_slot, inclusion: { in: TIME_SLOTS }
  validates :description, presence: true, allow_blank: true
  validates :day_schedule, presence: true
  # additional validations and methods...
end
