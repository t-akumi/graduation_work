require File.expand_path(File.dirname(__FILE__) + '/environment')
# cronを実行する環境変数周りの設定
ENV.each { |k, v| env(k, v) }
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env

# cronのログの吐き出し場所で確認&wheneverのテスト用

#every :minute do
#    command "echo 'hello, whenever world!' >> #{Rails.root}/log/cron.log"
#end

every :minute do
    rake 'auto_management:auto_decrease'
end
