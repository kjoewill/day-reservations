class RemoveExampleAsset < ActiveRecord::Migration[7.0]
  def up
    if Rails.env.production?
      Asset.find_by(name: 'Example Asset')&.destroy
    end
  end
end
