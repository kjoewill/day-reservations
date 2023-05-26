class DaySchedulesController < ApplicationController
  
  def show
    fail
    @asset = Asset.find(params[:id])
    @selected_date = Date.parse(params[:selected_date])
    @day_schedule = DaySchedule.find_or_create_by(asset_id: @asset.id, day: @selected_date)
    @time_slots = Reservation::TIME_SLOTS
  end

  def edit
    fail
    @time_slots = Reservation::TIME_SLOTS
    @asset = Asset.find(params[:asset_id])
    @selected_date = Date.parse(params[:selected_date])
    @day_schedule = @asset.schedule_for_day(@selected_date)
  end


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

    # Iterate over the reservations hash
    res_params.each do |reservation_id, reservation_attributes|
      # Find the reservation by ID
      reservation = Reservation.find(reservation_id)

      # Update the description attribute
      reservation.update(description: reservation_attributes[:description])
    end

    # After updating the reservations.  
    #return to this and check/handle update errors
    redirect_to root_path(datepicker: @selected_date)
    
  end
      
  private
  
  def day_schedule_params
    params.require(:day_schedule).permit!
  end

end
