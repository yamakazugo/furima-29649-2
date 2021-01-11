require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '配送先入力' do
    context '配送先入力ができるとき' do
      it 'postal_codeとshipping_origin_idとcityとaddressとbuilding_nameとphone_numberとtokenが存在していれば入力できる' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameが空でも入力できる' do
        @purchase_address.building_name = ""
        expect(@purchase_address).to be_valid
      end
      it 'priceとtokenがあれば保存できる' do
        expect(@purchase_address).to be_valid
      end
    end
    context '配送先入力ができないとき' do
      it 'postal_codeが空のとき' do
        @purchase_address.postal_code = ""
        @purchase_address.valid?
         expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないのとき' do
        @purchase_address.postal_code = "2110068"
        @purchase_address.valid?
         expect(@purchase_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'shipping_origin_idが空のとき' do
        @purchase_address.shipping_origin_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping origin is not a number")
      end
      it 'shipping_origin_idにid:1があると入力できない' do
        @purchase_address.shipping_origin_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping origin must be other than 1")
      end
      it 'cityが空のとき' do
        @purchase_address.city = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空のとき' do
        @purchase_address.address = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空のとき' do
        @purchase_address.phone_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberがハイフンがあると入力できない" do
        @purchase_address.phone_number = "090-1234-5678"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberが12桁以上のとき' do
        @purchase_address.phone_number = "090123456789"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number Input only number")
      end
      it 'tokenが空だと登録できないとき' do
        @purchase_address.token = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end