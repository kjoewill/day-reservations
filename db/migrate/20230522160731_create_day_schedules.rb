class CreateDaySchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :day_schedules do |t|
      t.date :day
      t.references :asset, null: false, foreign_key: true

      t.timestamps
    end
  end
end
