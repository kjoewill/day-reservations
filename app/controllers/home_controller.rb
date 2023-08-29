class HomeController < ApplicationController
  def index
    params.permit(:datepicker)
    @selected_date = (params[:datepicker] || Date.today).to_date
    @comment = Comment.find_or_create_by(day: @selected_date)
    @assets = Asset.by_sort_order
    @time_slots = Reservation::TIME_SLOTS
  end
end
