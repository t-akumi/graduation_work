class AddColumnsToAuthentications < ActiveRecord::Migration[7.2]
  def change
    add_reference :authentications, :user, null: false, foreign_key: true
    add_column :authentications, :provider, :string
    add_column :authentications, :uid, :string
  end
end
