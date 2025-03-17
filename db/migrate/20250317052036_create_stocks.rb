class CreateStocks < ActiveRecord::Migration[7.2]
  def change
    create_table :stocks do |t|
      t.string :name, null: false
      t.integer :purchase_interval
      t.integer :stock_quantity, null: false
      t.string :memo
      t.datetime :purchase_at

      t.timestamps
    end
  end
end
