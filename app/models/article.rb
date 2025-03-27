class Article < ApplicationRecord
    belongs_to :user
    validates :keyword, presence: true, length: {maximum: 18}
    validates :body, length: {maximum: 120}
end
