class CreateStockCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :stock_categories do |t|
      t.references :stock, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :stock_categories, [:stock_id, :category_id]
  end
end
