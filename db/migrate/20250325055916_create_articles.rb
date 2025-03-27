class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :keyword, null: false
      t.string :body, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
