require "test_helper"
require_relative '../test_data_helper'

class AssetsDeleteTest < ActiveSupport::TestCase
  include TestDataHelper # Include TestDataHelper module

  # Enable transactions for test methods
  self.use_transactional_tests = true
  
  setup do
    load_test_data # Load test data before each test
  end

  test 'If an asset is deleted then there are three' do
    asset = Asset.all.first
    assert_equal 'Glider-1', asset.name
    assert_equal 1, asset.day_schedules.count
    asset.day_schedules.each do |day_schedule|
        puts day_schedule.day
      end
    asset.destroy
    assert_equal 3, Asset.all.count
  end


  test 'There are always four Asset instances at the begining of a test' do
    assert_equal 4, Asset.count
  end

  test 'Glider-2 has one daySchedule and five reservations' do
    g2 = Asset.find_by(name: 'Glider-2')
    assert_equal 1, g2.day_schedules.count
    assert_equal 5, g2.day_schedules.first.reservations.count
  end 

  test 'If Glider-2 is deleted then so are its schedules and reservations' do
    assert_equal 4, DaySchedule.count
    assert_equal 20, Reservation.count

    g2 = Asset.find_by(name: 'Glider-2')
    day_sched_id = g2.day_schedules.first.id
    reservation_id = g2.day_schedules.first.reservations.first.id

    g2.destroy
    assert_equal 4-1, DaySchedule.count
    assert_equal 20-5, Reservation.count

    assert_raises(ActiveRecord::RecordNotFound) do
      DaySchedule.find(day_sched_id)
    end

    assert_raises(ActiveRecord::RecordNotFound) do
      Reservation.find(reservation_id)
    end
  end 

  test 'If all Gliders are deleted then so are all Day_Schedules and DayReservatios' do
    assert_equal 4, Asset.count
    assert_equal 4, DaySchedule.count
    assert_equal 20, Reservation.count

    Asset.destroy_all
    
    assert_equal 0, Asset.count
    assert_equal 0, DaySchedule.count
    assert_equal 0, Reservation.count
  end 

end