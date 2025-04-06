class StockMailer < ApplicationMailer
    default from: 'from@example.com'
    layout false
    def send_stock_letter(stock_id)
        @stock = Stock.find_by(id: stock_id)
        mail(to: @stock.user.email, subject: '残りひとつのストックがあります！')
    end
end
