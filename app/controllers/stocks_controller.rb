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

    def edit
        @stock = Stock.find(params[:id])
    end

    private

    def stock_params
        params.require(:stock).permit(:name,:purchase_interval,:stock_quantity,:memo).tap do |whitelisted|
            whitelisted[:purchase_interval] = params[:stock][:purchase_interval].tr('０-９', '0-9') if params[:stock][:purchase_interval]
            whitelisted[:stock_quantity] = params[:stock][:stock_quantity].tr('０-９', '0-9') if params[:stock][:stock_quantity]
        end
    end
end
