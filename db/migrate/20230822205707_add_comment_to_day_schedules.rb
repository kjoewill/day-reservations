class AddCommentToDaySchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :day_schedules, :comment, :string
  end
end
