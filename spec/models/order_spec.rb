require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
  describe '購入の申し込み' do
    context '申し込みが出来る場合' do
      it 'address_code,cityとaddress_number,telとprefecture_id,house_nameがあれば申し込みが出来る,' do
        expect(@order).to be_valid
      end
    end

    context '申し込みが出来ない場合' do
      it 'ユーザーが紐づいていないと申し込みできない' do
        @order.user = nil
        @order.valid?
      end

      it '商品が紐づいていないと申し込みできない' do
        @order.item = nil
        @order.valid?
      end

      it 'address_codeが空だと申し込みできない' do
        @order.address_code = ''
        @order.valid?
      end

      it 'cityが空だと申込ができない' do
        @order.city = ''
        @order.valid?
      end
    end
  end
end
