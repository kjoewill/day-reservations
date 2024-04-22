class Remove05HAsset < ActiveRecord::Migration[7.0]
  def change
    if Rails.env.production?
      Asset.find_by(name: 'N2905H (2-33)')&.destroy
    end
  end
end
