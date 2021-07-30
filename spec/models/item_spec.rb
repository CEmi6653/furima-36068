require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品の保存' do
    context "出品の情報が保存できる場合" do
      it "画像、名前、商品説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格があれば保存できる" do
        expect(@item).to be_valid
      end

      

    end
    context "出品の情報が保存できない場合" do
      it "画像がないと保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")

      end

      it "商品名がないと保存できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      
      it "商品の説明がないと保存できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "カテゴリーがないと保存できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
        
      end

      it "商品の状態がないと保存できない" do
        @item.quality_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end

      it "配送料の負担保存できない" do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it "発送元の地域がないと保存できない" do
        @item.delivery_source_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery source can't be blank")
        
      end
      it "発送までの日数がないと保存できない" do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
        
      end
      it "販売価格がないと保存できない" do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end
      it "販売価格が半角数字でないと保存できない" do
        @item.selling_price = '１２３４５６７'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end
      it "販売価格が300円以上でないと保存できない" do
        @item.selling_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be greater than or equal to 300")
     end
      it "販売価格が9999999円以下出ないと保存できない" do
        @item.selling_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be less than or equal to 9999999")
      end
    end
  end
end