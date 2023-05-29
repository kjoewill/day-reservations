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
      reservation = day_schedule.reservations.build(time_slot: time_slot, description: '')
  
      if reservation.save
        Rails.logger.info "Reservation created successfully: #{reservation.inspect}"
      else
        Rails.logger.error "Error creating reservation: #{reservation.errors.full_messages}"
      end
    end
  end
  
end
