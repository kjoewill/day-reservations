class DaySchedulesController < ApplicationController
  
 def reserve
    @time_slots = Reservation::TIME_SLOTS
    @asset = Asset.find(params[:asset_id])
    @selected_date = Date.parse(params[:selected_date])
    @day_schedule = @asset.schedule_for_day(@selected_date)
    render 'day_schedules/edit'
  end 

  def update
    @selected_date = Date.parse(params[:selected_date])
    reservations_params = params[:reservations]
  
    reservations_params.each do |time_slot, reservation_attributes|
      reservation = Reservation.find(reservation_attributes[:id])
      reservation.update(description: reservation_attributes[:description])
    end
  
    redirect_to root_path(datepicker: @selected_date)
  end
      
  private
  
  def day_schedule_params
    params.permit(:selected_date, reservations: [:id, :time_slot, :description])
  end

end
