#モデルのバリデーションのテスト
require 'rails_helper'

RSpec.describe User, type: :model do
  before do
      @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '保存できる場合' do

      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、kana_last_nameとkana_frist_name、birthdayがあれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上あれば登録できること' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
    end

    context '保存できない場合' do
      

      it 'nickname:空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'email:空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '@が入っていないと登録できない' do
        @user.email = "aaaa.com"
        @user.valid? 
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'password:空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'password:半角英語のみだと登録できない' do
        @user.password = 'cccccc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      
      it 'password:半角数字のみだと登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'password:全角英数字だと登録できない' do
        @user.password = '１２３ASD'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      
  
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confiramtionが不一致では登録できないこと' do
        @user.password = '123abc'
        @user.password_confirmation = '123abcd'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'password_confirmation:空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_name:空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが全角入力でなければ登録できないこと' do
        @user.last_name =  "ｱｲｳｴｵ" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end


      it 'first_name:空だと登録できない' do
        @user.first_name = ''
        @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが全角入力でなければ登録できないこと' do
        @user.first_name = "ｱｲｳｴｵ" # 意図的に半角入力を行いエラーを発生させる
        @user.valid?
       expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'kana_last_name:空だと登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end

      it 'kana_last_nameが全角カナでなければ登録できないこと' do
        @user.kana_last_name = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid")
      end

      it 'kana_first_name:空だと登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end

      it 'kana_first_nameが全角カナでなければ登録できないこと' do
        @user.kana_first_name =  "あいうえお" # 意図的にひらがな入力を行いエラーを発生させる
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid")
      end
  

      it 'birthday:空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end