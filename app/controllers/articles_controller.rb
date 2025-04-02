class ArticlesController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: %i[index show]
    
    def index
        @articles = Article.all.order(created_at: :desc)
        @phone_articles = Article.all.order(created_at: :desc).limit(3)
    end

    def new
        @article = Article.new
        @article.article_categories.build
    end

    def show
        @article = Article.find(params[:id])
        @comment = Comment.new
        @comments = @article.comments.includes(:user).order(created_at: :desc)
    end

    def create
        @article = Article.new(article_params)
        @article.user_id = current_user.id

        if @article.save
            redirect_to articles_path
        else
            render :new
        end
    end

    def edit
        @article = current_user.articles.find(params[:id])
    end

    def update
        @article = current_user.articles.find(params[:id])
        ActiveRecord::Base.transaction do
            @article.article_categories.destroy_all
            if @article.update(article_params)
                #ストック数が減少したら、quantity_update_atを変更する仕様にしているため、ここで在庫減少日を更新する必要はない。
                redirect_to articles_path
            else
                render :edit
            end
        end
    end

    def destroy
        @article = current_user.articles.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    private

    def article_params
        params.require(:article).permit(:keyword,:body, article_categories_attributes: [:category_id])
    end
end
