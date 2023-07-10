class UpdateForeignKeyConstraintForReservations < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :reservations, :day_schedules
    add_foreign_key :reservations, :day_schedules, on_delete: :cascade
  end
end
