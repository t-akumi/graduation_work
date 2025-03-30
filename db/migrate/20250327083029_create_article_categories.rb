class CreateArticleCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :article_categories do |t|
      t.references :article, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :article_categories, [:article_id, :category_id]
  end
end
