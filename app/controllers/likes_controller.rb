class LikesController < ApplicationController
    def create
        @article = Article.find(params[:id])
        current_user.like_arts << @article
        redirect_to params[:redirect_to] || articles_path
    end

    def destroy
        @article = Article.find(params[:id])
        current_user.like_arts.destroy(@article)
        redirect_to params[:redirect_to] || articles_path
    end

end