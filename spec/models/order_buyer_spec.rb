require 'rails_helper'
RSpec.describe OrderBuyer, type: :model do
  describe '#create' do
    before do
      @order_buyer = FactoryBot.build(:order_buyer)
      sleep 0.1
    end

    describe "商品の購入" do
      context "商品が購入できるとき" do
        it "全ての項目の入力が存在すれば購入できる" do
          expect(@order_buyer).to be_valid
        end
        it "postal_codeが3桁-4桁の半角文字列であれば購入できる" do
          @order_buyer.postal_code = "222-2222"
          expect(@order_buyer).to be_valid
        end
        it "発送先の地域についての情報が必須であること" do
          @order_buyer.prefecture_id = "3"
          expect(@order_buyer).to be_valid
        end
        it "buildingが空欄でも購入できる" do
          @order_buyer.building = ""
          expect(@order_buyer).to be_valid
        end
        it "phone_numberが10桁以上11桁以内の半角数字のみであれば購入できる" do
          @order_buyer.phone_number = "1111111111"
          expect(@order_buyer).to be_valid
        end
      end

      context "商品の購入ができないとき" do
        it "tokenが空だと購入できない" do
          @order_buyer.token = ""
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include "Token can't be blank"
        end
        it "postal_codeが空では購入できない" do
          @order_buyer.postal_code = ""
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include "Postal code can't be blank"
        end
        it "postal_codeが3桁-4桁の半角文字列でなければ購入できない" do
          @order_buyer.postal_code = "1-111111"
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include "Postal code is invalid"
        end
        it "postal_codeが-が含まれていなければ購入できない" do
          @order_buyer.postal_code = "1111111"
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include "Postal code is invalid"
        end
        it "postal_codeが英数字混合では購入できない" do
          @order_buyer.postal_code = "111-aaaa"
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include "Postal code is invalid"
        end
        it "postal_codeが全角文字列では購入できない" do
          @order_buyer.postal_code = "１１１ー１１１１"
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include "Postal code is invalid"
        end
        it "postal_codeが半角英字では購入できない" do
          @order_buyer.postal_code = "aaa-aaaa"
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include "Postal code is invalid"
        end
        it "postal_codeが8文字でなければ購入できない" do
          @order_buyer.postal_code = "111-11"
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include "Postal code is invalid"
        end
        it "prefecture_idが1では購入できない" do
          @order_buyer.prefecture_id = "1"
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include "Prefecture must be other than 1"
        end
        it "phone_numberが空では購入できない" do
          @order_buyer.phone_number = ""
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include "Phone number can't be blank"
        end
        it "phone_numberが全角数字では購入できない" do
          @order_buyer.phone_number = "１１１１１１１１１１１"
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include "Phone number is invalid"
        end
        it "phone_numberが数値以外だと購入できないこと" do
          @order_buyer.phone_number = "aaaaaaaaaa"
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include "Phone number is invalid"
        end
        it "phone_numberが英数字混合では購入できないこと" do
          @order_buyer.phone_number = "11111aaaaaa"
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include "Phone number is invalid"
        end
        it "phone_numberが9桁以下だと購入できない" do
          @order_buyer.phone_number = "11111"
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include "Phone number is invalid"
        end
        it "phone_numberが12桁以上だと購入できない" do
          @order_buyer.phone_number = "111111111111111"
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include "Phone number is invalid"
        end
        it "ユーザー情報が紐付いていない場合は購入できない" do
          @order_buyer.user_id = ""
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("User can't be blank")
        end
        it "商品情報が紐付いていない場合は購入できない" do
          @order_buyer.item_id = ""
          @order_buyer.valid?
          expect(@order_buyer.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
end