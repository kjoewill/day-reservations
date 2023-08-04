class LoadProductionData < ActiveRecord::Migration[7.0]
  def up
    if Rails.env.production?
      # Create assets or any production-specific data changes here
      Asset.create(name: 'N2905H (2-33)', sort_order: 10)
      Asset.create(name: 'N423BA (L-13)', sort_order: 20)
      Asset.create(name: 'N830SB (L-23)', sort_order: 30)
      Asset.create(name: 'N7747S (1-26)', sort_order: 40)
      Asset.create(name: 'N7643 (1-34)', sort_order: 50) 
      Asset.create(name: 'Tow Only', sort_order: 60)   
      Asset.create(name: 'Instructor', sort_order: 70)
    end
  end
end
