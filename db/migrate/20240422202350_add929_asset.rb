class Add929Asset < ActiveRecord::Migration[7.0]
  def change
    if Rails.env.production?
      Asset.create(name: 'N33929 (2-33)', sort_order: 10)
    end
  end
end
