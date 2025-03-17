class StocksController < ApplicationController
    before_action :require_login
    def index
        @stocks = Stock.where(user_id: current_user.id)
    end

    def new
        @stock = Stock.new
    end

    def create
        @stock = Stock.new(stock_params)
        @stock.user_id = current_user.id
        if @stock.save
            redirect_to stocks_path
        else
            render :new
        end
    end

    def show
        @stock = current_user.stocks.find(params[:id])
    end

    def edit
        @stock = current_user.stocks.find(params[:id])
    end

    def update
        @stock = current_user.stocks.find(params[:id])
        if @stock.update(stock_params)
            redirect_to stocks_path
        else
            render :edit
        end
    end

    def destroy
        @stock = current_user.stocks.find(params[:id])
        @stock.destroy!
        redirect_to stocks_path, success: "削除しました！", status: :see_other
    end

    def soon
        @stocks = current_user.stocks.where("stock_quantity <= ?" , 1)
    end

    private

    def stock_params
        params.require(:stock).permit(:name,:purchase_interval,:stock_quantity,:memo).tap do |whitelisted|
            whitelisted[:purchase_interval] = params[:stock][:purchase_interval].tr('０-９', '0-9') if params[:stock][:purchase_interval]
            whitelisted[:stock_quantity] = params[:stock][:stock_quantity].tr('０-９', '0-9') if params[:stock][:stock_quantity]
        end
    end
end
