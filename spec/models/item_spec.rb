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
        it "カテゴリーの情報が必須であること" do
          @item.category_id = "3"
          expect(@item).to be_valid
        end
        it "商品の状態についての情報が必須であること" do
          @item.sales_status_id = "3"
          expect(@item).to be_valid
        end
        it "配送料の負担についての情報が必須であること" do
          @item.shipping_fee_id = "3"
          expect(@item).to be_valid
        end
        it "発送元の地域についての情報が必須であること" do
          @item.prefecture_id = "3"
          expect(@item).to be_valid
        end
        it "発送までの日数についての情報が必須であること" do
          @item.scheduled_delivery_id = "3"
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
        it "category_idが1では登録できない" do
          @item.category_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include "Category must be other than 1"
        end
        it "sales_status_idが1では登録できない" do
          @item.sales_status_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include "Sales status must be other than 1"
        end
        it "shipping_fee_idが1では登録できない" do
          @item.shipping_fee_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include "Shipping fee must be other than 1"
        end
        it "prefecture_idが1では登録できない" do
          @item.prefecture_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
        end
        it "scheduled_delivery_idが1では登録できない" do
          @item.scheduled_delivery_id = "1"
          @item.valid?
          expect(@item.errors.full_messages).to include "Scheduled delivery must be other than 1"
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
        it "全角文字では登録できないこと" do
          @item.price = "１１１１"
          @item.valid?
          expect(@item.errors.full_messages).to include "Price is not a number"
        end
        it "英数字混合では登録できないこと" do
          @item.price = "111aaa"
          @item.valid?
          expect(@item.errors.full_messages).to include "Price is not a number"
        end
        it "半角英字では登録できないこ" do
          @item.price = "aaaaaaaa"
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
        it 'ユーザー情報がない場合は登録できないこと' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
      end
    end
  end
end