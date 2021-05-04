require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  describe '商品購入管理' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase = FactoryBot.build(:address_purchase, user_id: @user.id, item_id: @item.id )
    end

    context '商品が購入できる時' do

      it '全ての項目に正しい値が入力があれば保存できる' do
        expect(@purchase).to be_valid
      end

      it 'building_nameがなくても保存ができる' do
        @purchase.building_name = ""
        expect(@purchase).to be_valid
      end
    end

    context '商品が購入できない時' do

      it 'tokenがなければ保存ができない' do
        @purchase.token = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end

      it 'postalcodeが空の場合、保存ができない' do
        @purchase.postalcode = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postalcode is invalid. Input full-width characters.")
      end

      it 'postalcodeにハイフンがないと保存ができない' do
        @purchase.postalcode = "5333333"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postalcode is invalid. Input full-width characters.")
      end

      it 'postalcodeに6桁以下の数字を入れると保存ができない' do
        @purchase.postalcode = "123-456"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postalcode is invalid. Input full-width characters.")
      end

      it 'postalcodeに8桁以上だと保存ができない' do
        @purchase.postalcode = "123456789"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postalcode is invalid. Input full-width characters.")
      end

      it 'postalcodeに文字が入っていると保存ができない' do
        @purchase.postalcode = "123-567八"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postalcode is invalid. Input full-width characters.")
      end

      it 'region_idを選択しないと保存ができない' do
        @purchase.region_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Region must be other than 1")
      end

      it 'cityが空だと保存ができない' do
        @purchase.city = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end

      it 'streetが空だと保存ができない' do
        @purchase.street = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Street can't be blank")
      end

      it 'telが空だと保存ができない' do
        @purchase.tel = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Tel can't be blank", "Tel is invalid")
      end

      it 'telが数字以外入れると登録ができない' do
        @purchase.tel = "suuziwonyuu"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Tel is invalid")
      end

      it 'telが9桁以下だと登録ができない' do
        @purchase.tel = "123456789"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Tel is invalid")
      end

      it 'telが12桁以上だと登録ができない' do
        @purchase.tel = "123456789012"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Tel is invalid")
      end

      it 'telがハイフンが入ると登録ができない' do
        @purchase.tel = "090-1234-5678"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Tel is invalid")
      end

      it 'user_idが空では登録できない事' do
        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない事' do
        @purchase.item_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
