class Asset < ApplicationRecord
  has_many :day_schedules

  validates :name, presence: true, uniqueness: true
  validates :sort_order, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # any other logic or validations...

  def schedule_for_day(date)
    day_schedule = day_schedules.find_or_create_by(day: date)

    if day_schedule.reservations.empty?
      create_empty_reservations(day_schedule)
    end

    day_schedule
  end

  private

  def create_empty_reservations(day_schedule)
    Reservation::TIME_SLOTS.each do |time_slot|
      day_schedule.reservations.create(time_slot: time_slot, description: '')
    end
  end
  
end
