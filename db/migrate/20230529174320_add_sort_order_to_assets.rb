class AddSortOrderToAssets < ActiveRecord::Migration[7.0]
  def change
    add_column :assets, :sort_order, :integer
  end
end
