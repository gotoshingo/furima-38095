require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できる場合' do
      it "image,item_name,item_explanation,item_category_id,item_address_id,delivery_dey_id,pricenameが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameが空では登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "item_explanationが空では登録できない" do
        @item.item_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explanation can't be blank")
      end
      it "item_category_idが1では登録できない" do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it "item_condition_idが1では登録できない" do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it "delivery_category_idが1では登録できない" do
        @item.delivery_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery category can't be blank")
      end
      it "item_address_idが1では登録できない" do
        @item.item_address_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item address can't be blank")
      end
      it "delivery_dey_idが1では登録できない" do
        @item.delivery_dey_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery dey can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "item_nameが40文字より多いと登録できない" do
        @item.item_name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name is too long (maximum is 40 characters)") 
      end
      it "item_explanationが1,000文字より多いと登録できない" do
        @item.item_explanation = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explanation is too long (maximum is 1000 characters)")         
      end
      it "priceが300より小さいと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")         
      end
      it "priceが小数点であると登録できない" do
        @item.price =300.1
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be an integer")
      end
      it "priceが文字列であると登録できない" do
        @item.price ="aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが9,999,999より大きいと登録できない" do
        @item.price =10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "ユーザーが紐づいていないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
