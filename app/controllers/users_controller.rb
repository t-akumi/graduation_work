class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: %i[new create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            auto_login(@user)
            redirect_to root_path
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

    private

    def not_authenticated
        redirect_to login_path
    end

    def user_params
        params.require(:user).permit(:name,:password,:email,:password_confirmation)
    end

    
end
