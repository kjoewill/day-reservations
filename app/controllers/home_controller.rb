class HomeController < ApplicationController
  def index
    params.permit(:datepicker)
    @selected_date = (params[:datepicker] || Date.today).to_date
    @assets = Asset.order(:sort_order)
    @time_slots = Reservation::TIME_SLOTS
  end
end
