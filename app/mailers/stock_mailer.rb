class StockMailer < ApplicationMailer

    def send_stock_letter(stock_id)
        @stock = Stock.find_by(id: stock_id)
        mail(to: @stock.user.email, subject: '残りひとつのストックがあります！')
    end

    def test
        mail(to: "sakatagintoki78013@docomo.ne.jp", subject: "test")
    end
end
