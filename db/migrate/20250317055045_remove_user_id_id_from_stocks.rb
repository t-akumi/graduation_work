class RemoveUserIdIdFromStocks < ActiveRecord::Migration[7.2]
  def change
    remove_column :stocks, :user_id_id, :bigint
  end
end
