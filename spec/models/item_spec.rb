require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '新規商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品が出品できる時' do
      it 'name,profile,category_id,status_id,delivery_fee_id,prefecture_id,shipment_days_id,fee,imageが存在すれば出品できる' do
        expect(@item).to be_valid
      end

      it 'feeの値が300~9999999円以内であれば出品できる'do
        @item.fee = '9999999'
        expect(@item).to be_valid
      end

      it 'feeの値が半角数字あれば出品できる'do
        @item.fee = '300'
        expect(@item).to be_valid
      end 
    end
    

    context '商品が出品できない時' do
      it '画像ファイルが空と出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      
      it '商品名が空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      
      it '商品の説明がないと出品できない' do
        @item.profile = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Profile can't be blank")
      end
      
      it '商品カテゴリーの選択番号が１だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      
      it '商品の状態の選択番号が１だと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      
      it '配送料の負担の選択番号が１だと出品できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      
      it '発送元の地域の選択番号が１だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      
      it '発送までの日数の選択番号が１と出品できない' do
        @item.shipment_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment days must be other than 1")
      end
      
      it '金額が空だと出品できない' do
        @item.fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      
      it '金額が300より低いと出品できない' do
        @item.fee = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee 300〜9,999,999円の範囲で入力して下さい")
      end
      
      it '金額が9,999,999より高いと出品できない' do
        @item.fee = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee 300〜9,999,999円の範囲で入力して下さい")
      end
      
      it '金額が全角数字だと出品できない' do
        @item.fee = '１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee 半角数字を使用して下さい")
      end
      
      it '金額が全角文字だと出品できない' do
        @item.fee = 'あいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee 半角数字を使用して下さい")
      end
      
      it 'ユーザーが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
