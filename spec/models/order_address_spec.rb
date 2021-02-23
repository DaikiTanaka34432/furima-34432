require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, item_id:item.id, user_id:user.id )
      sleep(0.01)
    end

    context '商品購入ができる時' do
      it 'token,postal_code,prefecture_id,city,house_number,telephoneが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end

      it 'house_nameが空でも購入できる' do
        expect(@order_address).to be_valid
      end
    end
    
    context '商品購入ができない時' do
      it 'tokenが空だと購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと購入できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      
      it 'postal_codeはハイフン(-)がないと購入できない' do
        @order_address.postal_code = 1234567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Input correctly")
      end
      
      it 'postal_codeは前半3桁の半角数字、後半4桁の半角数字でないと購入できない' do
        @order_address.postal_code = 1234-567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Input correctly")
      end
      
      it 'prefecture_idは0が選択されいると購入できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      
      it 'cityが空だと登録できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      
      it 'house_numberが空だと購入できない' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      
      it 'telephpneが空だと購入できない' do
        @order_address.telephone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
      end
      
      it 'telephpneは半角数字でないと購入できない' do
        @order_address.telephone = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid. 11桁以内の半角数字で入力してください")
      end
      
      it 'telephpneにハイフンがあると購入できない' do
        @order_address.telephone = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid. 11桁以内の半角数字で入力してください")
      end
      
      it 'telephpneは11桁以内でないと購入できない' do
        @order_address.telephone = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid. 11桁以内の半角数字で入力してください")
      end
    end
  end
end