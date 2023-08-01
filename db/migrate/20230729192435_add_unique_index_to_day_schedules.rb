class AddUniqueIndexToDaySchedules < ActiveRecord::Migration[7.0]
  def change
    add_index :day_schedules, [:day, :asset_id], unique: true
  end
end
