class AddColumnToStock < ActiveRecord::Migration[7.2]
  def change
    add_column :stocks, :stock_updated_at, :datetime
  end
end
