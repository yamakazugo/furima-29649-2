require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do
    context '商品情報入力ができるとき' do
       it 'nameとinfoとcategory_idとsales_status_idとshipping_fee_idとprefecture_idとschedule_delivery_idとpriceとimageが存在していれば入力できる' do
        expect(@item).to be_valid
       end
    end
    context '商品情報入力ができないとき' do
       it 'imageがないと入力できない' do
         @item.image = nil
         @item.valid?
         expect(@item.errors.full_messages).to include("Image can't be blank")
       end
       it 'nameが空のとき入力できない' do
         @item.name = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Name can't be blank")
       end
       it 'infoが空のとき入力できない' do
         @item.info = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Info can't be blank")
       end
       it 'priceが空のとき入力できない' do
         @item.price = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Price can't be blank")
       end
       it 'priceが¥299以下の時入力できない' do
         @item.price = 299
         @item.valid?
         expect(@item.errors.full_messages).to include("Price is not included in the list")
       end
       it 'priceが¥10,000,000以上の時入力できない' do
         @item.price = 10000000
         @item.valid?
         expect(@item.errors.full_messages).to include("Price is not included in the list")
       end
       it "priceは半角数字でないと入力できない" do
         @item.price = "９８７"
         @item.valid?
         expect(@item.errors.full_messages).to include("Price Half-size number")
       end
       it 'category_idがないと入力できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
       end
       it 'category_idが--のとき入力できない' do
         @item.category_id = 1
         @item.valid?
         expect(@item.errors.full_messages).to include("Category Select")
       end
       it 'sales_status_idがないと入力できない' do
        @item.sales_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status Select")
       end
       it 'sales_status_idが--のとき入力できない' do
         @item.sales_status_id = 1
         @item.valid?
         expect(@item.errors.full_messages).to include("Sales status Select")
       end
       it 'shipping_fee_idがないと入力できない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee Select")
       end
       it 'shipping_fee_idが--のとき入力できない' do
         @item.shipping_fee_id = 1
         @item.valid?
         expect(@item.errors.full_messages).to include("Shipping fee Select")
       end
       it 'prefecture_idがないと入力できない' do
         @item.prefecture_id = nil
         @item.valid?
         expect(@item.errors.full_messages).to include("Prefecture Select")
       end
       it 'prefecture_idが--のとき入力できない' do
         @item.prefecture_id = 1
         @item.valid?
         expect(@item.errors.full_messages).to include("Prefecture Select")
       end
       it 'schedule_delivery_idがないと入力できない' do
        @item.schedule_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule delivery Select")
       end
       it 'schedule_delivery_idが--のとき入力できない' do
         @item.schedule_delivery_id = 1
         @item.valid?
         expect(@item.errors.full_messages).to include("Schedule delivery Select")
        end
        it "ユーザーが紐付いていないとツイートは保存できない" do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end
    end  
  end
end
