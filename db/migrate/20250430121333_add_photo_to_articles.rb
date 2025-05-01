class AddPhotoToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :photo, :string
  end
end
