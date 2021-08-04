require 'rails_helper'

RSpec.describe DonationAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @donation_address = FactoryBot.build(:donation_address, user_id: user.id, item_id: item.id,)
      sleep 0.1
    end


    context '内容に問題ない場合' do
      it '全ての値が正しく入力されている場合保存できる' do
        expect(@donation_address).to be_valid
      end

      it '建物名が空でも登録できる' do
        @donation_address.building_name = ''
        expect(@donation_address).to be_valid
      end

      it '全ての値とtokenがあれば保存できる' do
        expect(@donation_address).to be_valid
      end

      

    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できない' do
        @donation_address.postal_code = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号は半角文字列でないと保存できない' do
        @donation_address.postal_code = '１２３−４５６７'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
       
      it '都道府県が空だと保存できない' do
        @donation_address.delivery_source_id = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Delivery source can't be blank")
      end

      it '番地が空だと保存できない' do
        @donation_address.address = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと保存できない' do
        @donation_address.telephone_number = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '10桁以上11桁以内でないと保存できない' do
        @donation_address.telephone_number = '123456789'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Telephone number is invalid")
      end

      it '半角数値でないと保存できない' do
        @donation_address.telephone_number = '１２３４５６７８９０'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Telephone number is invalid")
      end

      it 'tokenが空だと登録できない' do
        @donation_address.token = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Token can't be blank")  
      end


    end
  end
end
