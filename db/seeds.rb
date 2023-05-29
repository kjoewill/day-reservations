# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create assets
assets = [
  { name: 'Glider-1', sort_order: 1 },
  { name: 'Glider-2', sort_order: 2 },
  { name: 'Glider-3', sort_order: 3 },
  { name: 'Glider-4', sort_order: 4 }
]

Asset.create(assets)

# Find the asset "Glider-2"
glider_2 = Asset.find_by(name: 'Glider-2')

# Create day schedule associated with "Glider-2"
day_schedule = glider_2.day_schedules.create(day: Date.new(2025, 9, 27))

# Create reservations
reservations = [
  { time_slot: '08:30', description: '08:30, G2, 09-27-57', day_schedule: day_schedule },
  { time_slot: '09:00', description: '09:00, G2, 09-27-57', day_schedule: day_schedule },
  { time_slot: '09:30', description: '09:30, G2, 09-27-57', day_schedule: day_schedule },
  { time_slot: '10:00', description: '10:00, G2, 09-27-57', day_schedule: day_schedule },
  { time_slot: '10:30', description: '10:30, G2, 09-27-57', day_schedule: day_schedule },
  { time_slot: '11:00', description: '11:00, G2, 09-27-57', day_schedule: day_schedule }
]

Reservation.create(reservations)