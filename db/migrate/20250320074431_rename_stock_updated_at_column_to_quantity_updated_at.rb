class RenameStockUpdatedAtColumnToQuantityUpdatedAt < ActiveRecord::Migration[7.2]
  def change
    rename_column :stocks, :stock_updated_at, :quantity_update_at
  end
end
