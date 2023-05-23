class DaySchedulesController < ApplicationController
  def modify
    fail
    @asset = Asset.find(params[:asset_id])
    @selected_date = Date.parse(params[:date])
    @day_schedule = DaySchedule.find_by(asset_id: params[:asset_id], day: @selected_date)

    if @day_schedule.nil?
      @day_schedule = DaySchedule.new(asset_id: params[:asset_id], day: @selected_date)
    end
  end
end
