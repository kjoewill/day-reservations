class HomeController < ApplicationController
  def index
    @selected_date = (params[:datepicker] || Date.today).to_date
    @day_schedules = DaySchedule.includes(:reservations).where(day: @selected_date)
    @assets = Asset.all
    @time_slots = Reservation::TIME_SLOTS
  end
end
