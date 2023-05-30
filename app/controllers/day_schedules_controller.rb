class DaySchedulesController < ApplicationController
  
 def reserve
    @time_slots = Reservation::TIME_SLOTS
    @asset = Asset.find(params[:asset_id])
    @selected_date = Date.parse(params[:selected_date])
    @day_schedule = @asset.schedule_for_day(@selected_date)
    render 'day_schedules/edit'
  end 

  def update
    @selected_date = Date.parse(day_schedule_params[:selected_date])
    res_params = params[:day_schedule][:reservations]

    res_params.each do |reservation_id, reservation_attributes|
      reservation = Reservation.find(reservation_id)
      reservation.update(description: reservation_attributes[:description])
    end

    redirect_to root_path(datepicker: @selected_date)
  end
      
  private
  
  def day_schedule_params
    params.require(:day_schedule).permit(:selected_date, reservations_attributes: [:id, :description])
  end

end
