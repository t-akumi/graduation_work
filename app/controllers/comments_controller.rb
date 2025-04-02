class CommentsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: %i[create destroy]
    def create
        comment = current_user.comments.build(comment_params)
        if comment.save
            redirect_to article_path(comment.article)
        else
            redirect_to article_path(comment.article)
        end
    end

    def destroy
        comment = current_user.comments.find(params[:id])
        comment.destroy
        redirect_to article_path(comment.article)
    end

    private

    def comment_params
        params.require(:comment).permit(:body).merge(article_id: params[:article_id])
    end
end