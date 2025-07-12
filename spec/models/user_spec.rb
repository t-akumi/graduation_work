require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'バリデーションに通ることを確認' do
      it '全情報取得' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザーの登録に失敗すること' do
      it 'nameがnill' do
        @user.name = ''
        expect(@user).to be_invalid
      end

      it 'nameが10文字を超える' do
        @user.name = 'testtesttest'
        expect(@user).to be_invalid
      end

      it 'emailがnill' do
        @user.email = ''
        expect(@user).to be_invalid
      end

      it 'passwordがnill' do
        @user.password = ''
        expect(@user).to be_invalid
      end

      it 'passwordが3文字未満' do
        @user.password = 'aa'
        expect(@user).to be_invalid
      end

    end
  end
end
