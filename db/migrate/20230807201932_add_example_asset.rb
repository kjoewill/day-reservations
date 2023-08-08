class AddExampleAsset < ActiveRecord::Migration[7.0]
  def up
    if Rails.env.production?
      Asset.create(name: 'Example Asset', sort_order: 100)
    end
  end
end
