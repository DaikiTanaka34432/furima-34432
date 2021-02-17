require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
  
      # ユーザー新規登録できる時
    it 'nickname/mail/password/password_confirmation/last_name/first_name/
        last_name_read/first_name_read/birthdayが存在すれば登録できること' do
     expect(@user).to be_valid
    end 

    it 'passwordが6文字以上だと登録できる' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user).to be_valid
    end

    it 'ユーザー本名は名字と名前が存在し、全角（漢字・ひらがな・カタカナ）で入力すれば登録できる' do
      @user.last_name = '山田'
      @user.first_name = 'はなこ'
      expect(@user).to be_valid
    end

    it 'ユーザー本名のフリガナは名字と名前が存在し、全角（カタカナ）で入力すれば登録できる' do
      @user.last_name_read = 'ヤマダ'
      @user.first_name_read = 'ハナコ'
      expect(@user).to be_valid
    end
    it ' 生年月日が存在すれば登録できる' do
      @user.birthday = '2000-01-01'
      expect(@user).to be_valid
    end


      # ユーザー新規登録できない時
    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end 
    
    it 'emailが空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在すると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email:@user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
 
    end

    it 'passwordが５文字以下だと登録できない' do
      @user.password ='12345'
      @user.password_confirmation ='12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation ='1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it 'last_nameが空だと登録できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameが全角（漢字・ひらがな・カタカナ）以外だと登録できない' do
      @user.last_name = "山田1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用して下さい")
    end
    
    it 'first_nameが空だと登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    
    it 'first_nameが全角（漢字・ひらがな・カタカナ）以外だと登録できない' do
      @user.first_name = "花子1"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用して下さい")
    end
    
    it 'last_name_readが空だと登録できない' do
      @user.last_name_read = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name read can't be blank")
    end
    
    it 'last_name_readが全角（カタカナ）以外だと登録できない' do
      @user.last_name_read = "やまだ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name read 全角カナ文字を使用して下さい")
    end
    
    it 'first_name_readが空だと登録できない' do
      @user.first_name_read= nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name read can't be blank")
    end
    
    it 'first_name_readが全角（カタカナ）以外だと登録できない' do
      @user.first_name_read= "はなこ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name read 全角カナ文字を使用して下さい")
    end
    
    it 'birthdayが空だと登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
