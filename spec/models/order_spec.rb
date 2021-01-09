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

      it 'address_numberが空だと申込ができない' do
        @order.address_number = ''
        @order.valid?
      end

      it 'telが空だと申込ができない' do
        @order.tel = ''
        @order.valid?
      end

      it 'prefecture_idが未選択だと申込ができない' do
        @order.prefecture_id = 1
        @order.valid?
      end

      it 'address_codeが数字以外の入力をすると申込ができない' do
        @order.address_code = 'アイウエオ'
        @order.valid?
      end

      it 'address_codeが8桁以上の場合、申込ができない' do
        @order.address_code = '10000000'
        @order.valid?
      end

      it 'telが数字以外で入力された場合、申込ができない' do
        @order.tel = 'aaaaaaa'
        @order.valid?
      end

      it 'telが12桁以上で入力された場合、申込ができない' do
        @order.tel = '012345678910'
        @order.valid?
      end
    end
  end
end
