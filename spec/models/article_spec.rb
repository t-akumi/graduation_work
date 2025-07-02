require 'rails_helper'

RSpec.describe Article, type: :model do

  before do
    @user = FactoryBot.create(:user)
    @article = FactoryBot.build(:article)
  end

  describe '記事の新規登録' do
    context '記事の作成に成功すること' do
      
      it '全情報取得' do
        expect(@article).to be_valid
      end
    end

    context '記事の作成に失敗すること' do

      it 'キーワードがない' do
        @article.keyword = ''
        expect(@article).to be_invalid
      end

      it 'bodyがない' do
        @article.body = ''
        expect(@article).to be_invalid
      end

      it 'userが存在しない' do
        @article.user = nil
        expect(@article).to be_invalid
      end
    end
  end
end
