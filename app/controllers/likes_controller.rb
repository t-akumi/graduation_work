class LikesController < ApplicationController
    def create
        @article = Article.find(params[:id])
        current_user.like_arts << @article
        respond_to do |format|
            format.turbo_stream
            format.html { redirect_to params[:redirect_to] || articles_path }
        end
    end

    def destroy
        @article = Article.find(params[:id])
        current_user.like_arts.destroy(@article)
        redirect_to params[:redirect_to] || articles_path
        respond_to do |format|
            format.turbo_stream
            format.html { redirect_to params[:redirect_to] || articles_path }
        end
    end

end