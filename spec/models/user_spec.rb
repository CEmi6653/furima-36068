#モデルのバリデーションのテスト
require 'rails_helper'

RSpec.describe User, type: :model do
  before do
      @user = FactoryBot.build(:user)
  end

  
  describe '#create' do

    it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、kana_last_nameとkana_frist_name、birthdayがあれば登録できる' do
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上あれば登録できること' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user).to be_valid
    end

    it 'nickname:必須' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'email:必須' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'password:必須' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
  
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confiramtionが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'password_confirmation:必須' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_name:必須' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameが全角入力でなければ登録できないこと' do
      @user.last_name =  "ｱｲｳｴｵ" 
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end


    it 'first_name:必須' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameが全角入力でなければ登録できないこと' do
      @user.first_name = "ｱｲｳｴｵ" # 意図的に半角入力を行いエラーを発生させる
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'kana_last_name:必須' do
      @user.kana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name can't be blank")
    end

    it 'kana_last_nameが全角カナでなければ登録できないこと' do
      @user.kana_last_name = "あいうえお"
      @user.valid?
    end

    it 'kana_first_name:必須' do
      @user.kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end

    it 'kana_first_nameが全角カナでなければ登録できないこと' do
      @user.kana_first_name =  "あいうえお" # 意図的にひらがな入力を行いエラーを発生させる
      @user.valid?
    end
  

    it 'birthday:必須' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end