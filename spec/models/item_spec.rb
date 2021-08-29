require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe "商品の出品" do
      context "商品が出品できるとき" do
        it "全ての項目の入力が存在すれば登録できること" do
          expect(@item).to be_valid
        end
        it "priceが半角数字であれば登録できる" do
          @item.price = "1111"
          expect(@item).to be_valid
        end
        it "priceが300~9999999の間であれば登録できる" do
          @item.price = "300"
          expect(@item).to be_valid
        end
      end

      context "商品の出品ができないとき" do
        it "nameが空だと登録できない" do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Name can't be blank"
        end
        it "infoが空では登録できない" do
          @item.info = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Info can't be blank"
        end
        it "category_idが空では登録できない" do
          @item.category_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Category can't be blank"
        end
        it "sales_status_idが空では登録できない" do
          @item.sales_status_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Sales status can't be blank"
        end
        it "shipping_fee_idが空では登録できない" do
          @item.shipping_fee_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
        end
        it "prefecture_idが空では登録できない" do
          @item.prefecture_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Prefecture can't be blank"
        end
        it "scheduled_delivery_idが空では登録できない" do
          @item.scheduled_delivery_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Scheduled delivery can't be blank"
        end
        it "priceが空では登録できない" do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include "Price can't be blank"
        end
        it "priceが半角数字でなければ登録できない" do
          @item.price = "１１１１"
          @item.valid?
          expect(@item.errors.full_messages).to include "Price is not a number"
        end
        it "priceの値が300以上でないと登録できない" do
          @item.price = "299"
          @item.valid?
          expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
        end
        it "priceの値が9999999以下でないと登録できない" do
          @item.price = "999999999"
          @item.valid?
          expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
        end
      end
    end
  end
end