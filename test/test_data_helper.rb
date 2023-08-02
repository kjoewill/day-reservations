module TestDataHelper
    def load_test_data
        puts "loading test data"
        # Create assets
        assets = [
            { name: 'Glider-1', sort_order: 1 },
            { name: 'Glider-2', sort_order: 2 },
            { name: 'Glider-3', sort_order: 3 },
            { name: 'Glider-4', sort_order: 4 }
        ]
            
        Asset.create(assets)
        
        # Find the asset "Glider-2"
        glider_1 = Asset.find_by(name: 'Glider-1')
        glider_2 = Asset.find_by(name: 'Glider-2')
        glider_3 = Asset.find_by(name: 'Glider-3')
        glider_4 = Asset.find_by(name: 'Glider-4')
        
        # Create day schedule associated with "Glider-2"
        g1_day_schedule = glider_1.day_schedules.create(day: Date.new(2025, 9, 27))
        g2_day_schedule = glider_2.day_schedules.create(day: Date.new(2025, 9, 27))
        g3_day_schedule = glider_3.day_schedules.create(day: Date.new(2025, 9, 27))
        g4_day_schedule = glider_4.day_schedules.create(day: Date.new(2025, 9, 27))
        
        # Create reservations
        reservations = [
            { time_slot: '08:30', description: '08:30, G1, 09-27-25', day_schedule: g1_day_schedule },
            { time_slot: '09:00', description: '09:00, G1, 09-27-25', day_schedule: g1_day_schedule },
            { time_slot: '09:30', description: '09:30, G1, 09-27-25', day_schedule: g1_day_schedule },
            { time_slot: '10:00', description: '10:00, G1, 09-27-25', day_schedule: g1_day_schedule },
            { time_slot: '10:30', description: '10:30, G1, 09-27-25', day_schedule: g1_day_schedule },
            { time_slot: '11:00', description: '11:00, G1, 09-27-25', day_schedule: g1_day_schedule },
            
            { time_slot: '08:30', description: '08:30, G2, 09-27-25', day_schedule: g2_day_schedule },
            { time_slot: '09:00', description: '09:00, G2, 09-27-25', day_schedule: g2_day_schedule },
            { time_slot: '09:30', description: '09:30, G2, 09-27-25', day_schedule: g2_day_schedule },
            { time_slot: '10:00', description: '10:00, G2, 09-27-25', day_schedule: g2_day_schedule },
            { time_slot: '10:30', description: '10:30, G2, 09-27-25', day_schedule: g2_day_schedule },
            { time_slot: '11:00', description: '11:00, G2, 09-27-25', day_schedule: g2_day_schedule },
        
            { time_slot: '08:30', description: '08:30, G2, 09-27-25', day_schedule: g3_day_schedule },
            { time_slot: '09:00', description: '09:00, G2, 09-27-25', day_schedule: g3_day_schedule },
            { time_slot: '09:30', description: '09:30, G2, 09-27-25', day_schedule: g3_day_schedule },
            { time_slot: '10:00', description: '10:00, G2, 09-27-25', day_schedule: g3_day_schedule },
            { time_slot: '10:30', description: '10:30, G2, 09-27-25', day_schedule: g3_day_schedule },
            { time_slot: '11:00', description: '11:00, G2, 09-27-25', day_schedule: g3_day_schedule },
        
            { time_slot: '08:30', description: '08:30, G2, 09-27-25', day_schedule: g4_day_schedule },
            { time_slot: '09:00', description: '09:00, G2, 09-27-25', day_schedule: g4_day_schedule },
            { time_slot: '09:30', description: '09:30, G2, 09-27-25', day_schedule: g4_day_schedule },
            { time_slot: '10:00', description: '10:00, G2, 09-27-25', day_schedule: g4_day_schedule },
            { time_slot: '10:30', description: '10:30, G2, 09-27-25', day_schedule: g4_day_schedule },
            { time_slot: '11:00', description: '11:00, G2, 09-27-25', day_schedule: g4_day_schedule }
        ]
        
        Reservation.create(reservations)  
    end
  end