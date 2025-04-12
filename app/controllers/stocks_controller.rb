class StocksController < ApplicationController
    before_action :require_login
    def index
        @categories = Category.all
        @q = Stock.ransack(params[:q])
        @stocks = @q.result(distinct: true).where(user_id: current_user.id)
        @phone_articles = Article.all.order(created_at: :desc).limit(3)
    end

    def new
        @stock = Stock.new
        @stock.stock_categories.build
    end

    def create
        @stock = Stock.new(stock_params)
        @stock.user_id = current_user.id
        @stock.quantity_update_at = Time.current
        
        if @stock.save
            redirect_to stocks_path
        else
            respond_to do |format|
                format.turbo_stream do
                    render turbo_stream: turbo_stream.update('flash') {
                    render_to_string inline: "<div id='flash' class='text-danger text-center'>入力内容に不備があります</div>"
                    }
                end
            end
        end
    end

    def show
        @stock = current_user.stocks.includes(:categories).find(params[:id])
        @category = @stock.categories.first.name
    end

    def edit
        @stock = current_user.stocks.find(params[:id])
    end

    def update
        @stock = current_user.stocks.find(params[:id])

        ActiveRecord::Base.transaction do
            @stock.stock_categories.destroy_all
            if @stock.update(stock_params)
                #ストック数が減少したら、quantity_update_atを変更する仕様にしているため、ここで在庫減少日を更新する必要はない。
                redirect_to stocks_path
            else
                respond_to do |format|
                    format.turbo_stream do
                        render turbo_stream: turbo_stream.update('flash') {
                        render_to_string inline: "<div id='flash' class='text-danger text-center'>入力内容に不備があります</div>"
                        }
                    end
                end
            end
        end
    end

    def destroy
        @stock = current_user.stocks.find(params[:id])
        @stock.destroy!
        redirect_to stocks_path, success: "削除しました！", status: :see_other
    end

    def soon
        @categories = Category.all
        @q = Stock.ransack(params[:q])
        @stocks = @q.result(distinct: true).where(user_id: current_user.id).where("stock_quantity <= ?" , 1)
        @phone_articles = Article.all.order(created_at: :desc).limit(3)
    end

    private

    def stock_params
        params.require(:stock).permit(:name,:purchase_interval,:stock_quantity,:memo, stock_categories_attributes: [:category_id]).tap do |whitelisted|
            whitelisted[:purchase_interval] = params[:stock][:purchase_interval].tr('０-９', '0-9') if params[:stock][:purchase_interval]
            whitelisted[:stock_quantity] = params[:stock][:stock_quantity].tr('０-９', '0-9') if params[:stock][:stock_quantity]
        end
    end

    def not_authenticated
        redirect_to login_path
    end

end
