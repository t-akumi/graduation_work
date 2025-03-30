class Stock < ApplicationRecord
    belongs_to :user
    has_many :stock_categories, dependent: :destroy
    has_many :categories, through: :stock_categories
    accepts_nested_attributes_for :stock_categories
    validates :name, presence: true, length: {maximum: 25}
    validates :purchase_interval, allow_blank: true, numericality: {only_integer: true}
    validates :memo, length: {maximum: 120}
    validates :stock_quantity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
