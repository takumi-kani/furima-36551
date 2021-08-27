require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe "ユーザー新規登録" do
      context "新規登録できるとき" do
        it "全ての項目の入力が存在すれば登録できること" do
          expect(@user).to be_valid
        end
        it "passwordが６文字以上の半角英数字混合であれば登録できる" do
          @user.password = "000aaa"
          @user.password_confirmation = "000aaa"
          expect(@user).to be_valid
        end
        it "last_nameが英数字以外の全角文字であれば登録できる" do
          @user.last_name = "鈴木"
          expect(@user).to be_valid
        end
        it "first_nameが英数字以外の全角文字であれば登録できる" do
          @user.first_name = "一郎"
          expect(@user).to be_valid
        end
        it "last_name_kanaが全角カナであれば登録できる" do
          @user.last_name_kana = "スズキ"
          expect(@user).to be_valid
        end
        it "first_name_kanaが全角カナであれば登録できる" do
          @user.first_name_kana = "イチロウ"
          expect(@user).to be_valid
        end
      end

      context "新規登録できないとき" do
        it "nicknameが空だと登録できない" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include "Nickname can't be blank"
        end
        it "emailが空では登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include "Email can't be blank"
        end
        it "emailに@が含まれていないと登録できない" do
          @user.email = "testtest"
          @user.valid?
          expect(@user.errors.full_messages).to include "Email is invalid"
        end
        it "同じemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include "Email has already been taken"
        end
        it "passwordが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include "Password can't be blank"
        end
        it "passwordが5文字以下であれば登録できない" do
          @user.password = "00aaa"
          @user.valid?
          expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
        end
        it "passwordは英数字混合でないと登録できない" do
          @user.password = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include "Password is invalid"
        end
        it "passwordは全角では登録できない" do
          @user.password = "ａａａ１１１"
          @user.valid?
          expect(@user.errors.full_messages).to include "Password is invalid"
        end
        it "passwordは数字のみでは登録できない" do
          @user.password = "111111"
          @user.valid?
          expect(@user.errors.full_messages).to include "Password is invalid"
        end
        it "passwordを入力していてもpassword_confirmationが空では登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
        end
        it "passwordとpassword_confirmationが一致していないと登録できない" do
          @user.password = "aaa111"
          @user.password_confirmation = "111aaa"
          @user.valid?
          expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
        end
        it "last_nameが空では登録できない" do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include "Last name can't be blank"
        end
        it "last_nameが全角ひらがなカタカナ漢字でないと登録できない" do
          @user.last_name = "aaa"
          @user.valid?
          expect(@user.errors.full_messages).to include "Last name is invalid"
        end
        it "first_nameが空では登録できない" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include "First name can't be blank"
        end
        it "first_nameが全角ひらがなカタカナ漢字でないと登録できない" do
          @user.first_name = "ｱｱｱ"
          @user.valid?
          expect(@user.errors.full_messages).to include "First name is invalid"
        end
        it "last_name_kanaが空では登録できない" do
          @user.last_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include "Last name kana can't be blank"
        end
        it "last_name_kanaが全角カタカナでないと登録できない" do
          @user.last_name_kana = "あああ"
          @user.valid?
          expect(@user.errors.full_messages).to include "Last name kana is invalid"
        end
        it "first_name_kanaが空では登録できない" do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include "First name kana can't be blank"
        end
        it "first_name_kanaが全角カタカナでないと登録できない" do
          @user.first_name_kana = "太郎"
          @user.valid?
          expect(@user.errors.full_messages).to include "First name kana is invalid"
        end
        it "birth_dateが空では登録できない" do
          @user.birth_date = ""
          @user.valid?
          expect(@user.errors.full_messages).to include "Birth date can't be blank"
        end
      end
    end
  end
end