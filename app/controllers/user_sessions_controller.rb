class UserSessionsController < ApplicationController

    def new; end

    def create
        @user = login(params[:email],params[:password])

        if @user
            redirect_to stocks_path
        else
            render :new
        end
    end

    def destroy
        logout
        redirect_to root_path
    end

end
