class Category < ApplicationRecord
    has_many :article_categories
    has_many :stock_categories
    has_many :articles, through: :article_categories
    has_many :stocks, through: :stock_categories
end
