class Article < ApplicationRecord
    belongs_to :user
    has_many :article_categories, dependent: :destroy
    has_many :comments, dependent: :destroy
    accepts_nested_attributes_for :article_categories
    has_many :categories, through: :article_categories
    validates :keyword, presence: true, length: {maximum: 18}
    validates :body, length: {maximum: 120}, presence: true
end
