require 'rails_helper'
RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    context"登録できない場合" do
      it "nick_nameが空だと登録できない" do
         @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick nameを入力してください")
      end
      it "emailが空では登録できない" do
         @user.email = ''
         @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
     it "重複したメールアドレスは登録できない" do
       @user.save
       another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
     it "メールアドレスに@を含まない場合は登録できない" do
       @user.email = 'kkkgmail.com'
       @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "encrypted_passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
     end
     it "password_confirmationがencrypted_passwordと一致でないと登録できない" do
      @user.password_confirmation = '123abc'
       @user.valid?
       expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
     it "パスワードが6文字未満では登録できない" do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
     it "英字のみのパスワードでは登録できない" do
        @user.password = 'abcdef'
        @user.valid?
       expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "数字のみのパスワードでは登録できない" do
        @user.password = '123456'
         @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "全角文字を含むパスワードでは登録できない" do
        @user.password = 'あbc1２3'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
     it "password_confirmationが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First nameを入力してください")
      end
      it "姓（全角）に半角文字が含まれていると登録できない" do
        @user.first_name = 't太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("First nameは不正な値です")
      end
      it "second_nameが空では登録できない" do
        @user.second_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Second nameを入力してください")
      end
      it "名（全角）に半角文字が含まれていると登録できない" do
        @user.second_name = 't田中'
        @user.valid?
        expect(@user.errors.full_messages).to include("Second nameは不正な値です")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanaを入力してください")
      end
        it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.first_name_kana = '太ろu+'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanaは不正な値です")
      end
      it "second_name_kanaが空では登録できない" do
        @user.second_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Second name kanaを入力してください")
        end
      it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.second_name_kana = '田なka?'
        @user.valid?
        expect(@user.errors.full_messages).to include("Second name kanaは不正な値です")
      end
      it "date_of_birthが空では登録できない" do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birthを入力してください")
      end
    end
    context "登録できる場合" do
      it "すべての情報が正しく入力された場合、登録できること" do
        expect(@user).to be_valid
      end
    end
  end
end
