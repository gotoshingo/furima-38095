require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  describe '購入記録の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@record_address).to be_valid
      end
      it 'address_buildingは空でも保存できること' do
        @record_address.address_building = ''
        expect(@record_address).to be_valid
      end
      it 'phone_numberは10桁でも保存できること' do
        @record_address.phone_number = '0123456789'
        expect(@record_address).to be_valid
      end
      it 'phone_number0以外の番号から始まっても保存ができる' do
        @record_address.phone_number = '12345678901'
        expect(@record_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では保存できないこと' do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'address_numberが空だと保存できないこと' do
        @record_address.address_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Address number can't be blank")
      end
      it 'address_numberが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @record_address.address_number = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Address number is invalid. Include hyphen(-)")
      end
      it 'item_address_idを選択していないと保存できないこと' do
        @record_address.item_address_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item address can't be blank")
      end
      it 'address_cityが空だと保存できないこと' do
        @record_address.address_city = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Address city can't be blank")
      end
      it 'address_houseが空だと保存できないこと' do
        @record_address.address_house = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Address house can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberがハイフンを含むと保存できないこと' do
        @record_address.phone_number = '090-1234-56789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが9桁より少ないと保存できない' do
        @record_address.phone_number = '012345678'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが11桁より多いと保存できない' do
        @record_address.phone_number = '090123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが半角数字以外だと保存ができない' do
        @record_address.phone_number = '０９０１２３４５６７８'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberにアルファベットが含まれると保存ができない' do
        @record_address.phone_number = 'abcdefghijk'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @record_address.item_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end