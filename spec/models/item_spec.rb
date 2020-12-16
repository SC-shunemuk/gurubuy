require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context '商品の保存ができる場合' do
      it 'imageとname、contentとcategory、statusとjoint_buying、shipping_methodとpriceがあれば商品は保存される' do
        expect(@item).to be_valid
      end
    end
    context '商品の保存ができない場合' do
      it 'ユーザーが紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
      it 'imageが空だと商品を保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'nameが空だと保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'contentが空だと保存できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("説明文を入力してください")
      end
      it 'category未選択だと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーが正しく選択されていません。')
      end
      it 'statusが未選択だと保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態が正しく選択されていません。')
      end
      it 'joint_buyingが未選択だと保存できない' do
        @item.joint_buying_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('出品数が正しく選択されていません。')
      end
      it 'shipping_methodが未選択だと保存できない' do
        @item.shipping_method_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送方法が正しく選択されていません。')
      end
      it 'priceが空だと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください" && '価格は数値で入力してください' && '価格は不正な値です')
      end

      it 'priceが半角数字以外で入力されていると保存できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'priceが300以下だと保存できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end

      it 'priceが9,999,999以上だと保存できない' do
        @item.price = '99_999_999'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
    end
  end
end
