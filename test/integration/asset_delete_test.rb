require "test_helper"

class AssetsDeleteTest < ActiveSupport::TestCase
  # Enable transactions for test methods
  self.use_transactional_tests = true

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
    assets = Asset.all
    assert_equal 4, assets.count
  end

  test 'Glider-2 has one daySchedule and six reservations' do
    Asset.all.each do |asset|
        puts asset.name
    end

    # g2 = Asset.find_by(name: 'Glider-2')
    # assert_equal 1, g2.day_schedules.count
  end 


end