class Stock < ApplicationRecord
    belongs_to :user
    has_many :stock_categories, dependent: :destroy
    has_many :categories, through: :stock_categories
    accepts_nested_attributes_for :stock_categories
    validates :name, presence: true, length: {maximum: 25}
    validates :purchase_interval, allow_blank: true, numericality: {only_integer: true}
    validates :memo, length: {maximum: 120}
    validates :stock_quantity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

    def line_push
        client ||= Line::Bot::V2::MessagingApi::ApiClient.new(
            channel_access_token: ENV.fetch("LINE_CHANNEL_TOKEN_MESSAGE")
        )

        request = Line::Bot::V2::MessagingApi::PushMessageRequest.new(
            to: self.user.email,
            messages: [
                Line::Bot::V2::MessagingApi::TextMessage.new(text: "#{self.user.name}さま　\n残り１つとなった在庫をお知らせします!\n\n#{self.name}")
            ]
        )
        
        response = client.push_message(push_message_request: request)
        puts response
    end
end
