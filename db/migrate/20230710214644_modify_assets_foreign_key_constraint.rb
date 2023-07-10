class ModifyAssetsForeignKeyConstraint < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :day_schedules, :assets
  end
end
