class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :time_slot
      t.string :description
      t.references :day_schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
