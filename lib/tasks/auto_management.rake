
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
        StockMailer.send_stock_letter.deliver_now
    end

end
