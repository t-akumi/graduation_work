class Stock < ApplicationRecord
    belongs_to :user
    validates :name, presence: true, length: {maximum: 25}
    validates :purchase_interval, allow_blank: true, numericality: {only_integer: true}
    validates :memo, length: {maximum: 120}
    validates :stock_quantity, presence: true, numericality: {only_integer: true}
end
