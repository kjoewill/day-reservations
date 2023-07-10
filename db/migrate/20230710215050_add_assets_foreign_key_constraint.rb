class AddAssetsForeignKeyConstraint < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :day_schedules, :assets, on_delete: :cascade
  end
end
