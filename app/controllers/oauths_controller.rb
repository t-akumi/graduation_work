class OauthsController < ApplicationController
    def oauth
      login_at(params[:provider])
    end
  
    def callback
      provider = params[:provider]

      puts "★★ LINEからのデータ： #{request.env['omniauth.auth'].inspect}" #デバック用


      if (@user = login_from(provider))
        redirect_to stocks_path
      else
        @user = create_from(provider)
  
        if @user.persisted?
          reset_session
          auto_login(@user)
          redirect_to stocks_path #新規登録&ログインして飛ぶとこ
        else
          redirect_to login_path
        end
      end
    end 
end
