namespace :auto_management do
    desc "在庫の自動管理(引き落とし)"
    task auto_decrease: :environment do
        Stock.find_each do |stock|
            passed_days = (Date.current - stock.quantity_update_at.to_date).to_i

            if stock.purchase_interval != nil
                if passed_days >= stock.purchase_interval
                    stock.stock_quantity -= 1
                    if stock.stock_quantity == 1
                        if stock.user.email.include?("@")
                            StockMailer.send_stock_letter(stock.id).deliver_now
                        else
                            stock.line_push
                        end
                    end
                    stock.quantity_update_at = Time.current
                    stock.save
                end
            end
        end
    end

    task send_stock_letter: :environment do
        StockMailer.test.deliver_now
    end
end



=begin Mailerテスト
namespace :auto_management do
    desc "在庫の自動管理(引き落とし)"
    task auto_decrease: :environment do
        Stock.find_each do |stock|
            passed_days = (Date.current - stock.quantity_update_at.to_date).to_i

            if stock.purchase_interval != nil
                if passed_days >= stock.purchase_interval
                    stock.stock_quantity -= 1
                    if stock.stock_quantity == 1
                        StockMailer.send_stock_letter(stock.id).deliver_now
                    end
                    stock.quantity_update_at = Time.current
                    stock.save
                end
            end
        end
    end

    task send_stock_letter: :environment do
        StockMailer.test.deliver_now
    end
end


LINE通知テスト
namespace :push_task do
    desc "LINEBOT：タスクの通知" 
    task :push_line_message_task => :environment do
        client ||= Line::Bot::V2::MessagingApi::ApiClient.new(
            channel_access_token: ENV.fetch("LINE_CHANNEL_TOKEN_MESSAGE")
        )

        stock = Stock.find(48)
        user = User.find_by(email: stock.user.email)
        request = Line::Bot::V2::MessagingApi::PushMessageRequest.new(
            to: stock.user.email,
            messages: [
                Line::Bot::V2::MessagingApi::TextMessage.new(text: "#{stock.user.name}さま　\n残り１つとなった在庫をお知らせします!\n\n#{user.stocks.first.name}")
            ]
        )
        
        response = client.push_message(push_message_request: request)
        puts response
          
    end
=end

