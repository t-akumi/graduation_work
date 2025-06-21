class OauthsController < ApplicationController
    def oauth
      login_at(params[:provider])
    end
  
    def callback
      provider = auth_params[:provider]

      if (@user = login_from(provider))
        redirect_to stocks_path, allow_other_host: true
      else
        begin
            @user = create_from(provider)
            auto_login(@user)
            redirect_to stocks_path #新規登録&ログインして飛ぶとこ
        rescue StandardError
          redirect_to root_path, allow_other_host: true
        end
      end
    end 

    private

    def auth_params
        params.permit(:code, :provider, :error, :state)
    end

end
