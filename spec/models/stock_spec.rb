require 'rails_helper'

RSpec.describe Stock, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @stock = FactoryBot.build(:stock)
  end

  describe '在庫登録' do

    context '在庫の登録に成功すること' do
      it '全情報取得' do
        expect(@stock).to be_valid
      end
    end

    context '在庫の登録に失敗すること' do
      it 'nameがnill' do
        @stock.name = ''
        expect(@stock).to be_invalid
      end

      it 'stock_quantityがnill' do
        @stock.stock_quantity = ''
        expect(@stock).to be_invalid
      end

      it 'userが存在しない' do
        @stock.user = nil
        expect(@stock).to be_invalid
      end

      it '購入スパンが数字ではない' do
        @stock.purchase_interval = 'aaa'
        expect(@stock).to be_invalid
      end

      it '在庫量が数字ではない' do
        @stock.stock_quantity = 'aaa'
        expect(@stock).to be_invalid
      end

    end

  end
end
