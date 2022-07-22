require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
     it "nick_nameが空だと登録できない" do
       user = User.new(nick_name: "", email: "kkk@gmail.com", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001-12-11")
       user.valid?
       expect(user.errors.full_messages).to include("Nick name can't be blank")
     end
     it "emailが空では登録できない" do
       user = User.new(nick_name: "abe", email: "", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001-12-11")
       user.valid?
       expect(user.errors.full_messages).to include("Email can't be blank")
     end
     it "重複したメールアドレスは登録できない" do
      user = User.new(nick_name: "abe", email: "test@test", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001-12-11")
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it "メールアドレスに@を含まない場合は登録できない" do
      user = User.new(nick_name: "abe", email: "kkkgmail.com", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001-12-11")
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it "encrypted_passwordが空では登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "", password_confirmation: "abc123",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001-12-11")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationがencrypted_passwordと一致でないと登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "123abc",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001-12-11")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードが6文字未満では登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc12", password_confirmation: "abc12",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001-12-11")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "英字のみのパスワードでは登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abcdef", password_confirmation: "abcdef",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001-12-11")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "数字のみのパスワードでは登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "123456", password_confirmation: "123456",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001-12-11")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "全角文字を含むパスワードでは登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "あbc1２3", password_confirmation: "あbc1２3",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001-12-11")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "password_confirmationが空では登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001-12-11")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "first_nameが空では登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001-12-11")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "姓（全角）に半角文字が含まれていると登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "t太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001-12-11")
      user.valid?
      expect(user.errors.full_messages).to include("First name is invalid")
    end
    it "second_nameが空では登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "太郎",second_name: "",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001-12-11")
      user.valid?
      expect(user.errors.full_messages).to include("Second name can't be blank")
    end
    it "名（全角）に半角文字が含まれていると登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "太郎",second_name: "t田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001-12-11")
      user.valid?
      expect(user.errors.full_messages).to include("Second name is invalid")
    end
    it "first_name_kanaが空では登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "太郎",second_name: "田中",first_name_kana: "",second_name_kana: "タナカ",date_of_birth: "2001-12-11")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "太郎",second_name: "田中",first_name_kana: "太ろu+",second_name_kana: "タナカ",date_of_birth: "2001-12-11")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana is invalid")
    end
    it "second_name_kanaが空では登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "",date_of_birth: "2001-12-11")
      user.valid?
      expect(user.errors.full_messages).to include("Second name kana can't be blank")
    end
    it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "田なka?",date_of_birth: "2001-12-11")
      user.valid?
      expect(user.errors.full_messages).to include("Second name kana is invalid")
    end
    it "date_of_birthが空では登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "")
      user.valid?
      expect(user.errors.full_messages).to include("Date of birth can't be blank")
    end
   end
 end
