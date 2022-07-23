require 'rails_helper'
RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    it "nick_nameが空だと登録できない" do
       @user.nick_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
    it "emailが空では登録できない" do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したメールアドレスは登録できない" do
      @user.email = 'test@test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "メールアドレスに@を含まない場合は登録できない" do
      @user.email = 'kkkgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "encrypted_passwordが空では登録できない" do
      @user.encrypted_password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationがencrypted_passwordと一致でないと登録できない" do
      @user.password_confirmation = '123abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードが6文字未満では登録できない" do
      @user.encrypted_password = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "英字のみのパスワードでは登録できない" do
      @user.encrypted_password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "数字のみのパスワードでは登録できない" do
      @user.encrypted_password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "全角文字を含むパスワードでは登録できない" do
      @user.encrypted_password = 'あbc1２3'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "password_confirmationが空では登録できない" do
      @user.encrypted_password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "姓（全角）に半角文字が含まれていると登録できない" do
      @user.first_name = 't太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "second_nameが空では登録できない" do
      @user.second_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name can't be blank")
    end
    it "名（全角）に半角文字が含まれていると登録できない" do
      @user.second_name = 't田中'
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name is invalid")
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.first_name_kana = '太ろu+'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "second_name_kanaが空では登録できない" do
      @user.second_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name kana can't be blank")
    end
    it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.second_name_kana = '田なka?'
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name kana is invalid")
    end
    it "date_of_birthが空では登録できない" do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end
   end
 end
