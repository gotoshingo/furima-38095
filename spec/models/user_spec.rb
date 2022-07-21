require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
     it "nick_nameが空だと登録できない" do
       user = User.new(nick_name: "", email: "kkk@gmail.com", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001", "12" , "11")
       user.valid?
       expect(user.errors.full_messages).to include("nick_name can't be blank")
     end
     it "emailが空では登録できない" do
       user = User.new(nick_name: "abe", email: "", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001", "12" , "11")
       user.valid?
       expect(user.errors.full_messages).to include("Email can't be blank")
     end
     it "encrypted_passwordが空では登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "", password_confirmation: "abc123",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001", "12" , "11")
      user.valid?
      expect(user.errors.full_messages).to include("encrypted_password can't be blank")
    end
    it "password_confirmationがencrypted_passwordと一致でないと登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "123abc",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001", "12" , "11")
      user.valid?
      expect(user.errors.full_messages).to include("password_confirmation can't be blank")
    end
    it "password_confirmationが空では登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001", "12" , "11")
      user.valid?
      expect(user.errors.full_messages).to include("encrypted_password can't be blank")
    end
    it "first_nameが空では登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001", "12" , "11")
      user.valid?
      expect(user.errors.full_messages).to include("first_name can't be blank")
    end
    it "second_nameが空では登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "太郎",second_name: "",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "2001", "12" , "11")
      user.valid?
      expect(user.errors.full_messages).to include("second_name can't be blank")
    end
    it "first_name_kanaが空では登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "太郎",second_name: "田中",first_name_kana: "",second_name_kana: "タナカ",date_of_birth: "2001", "12" , "11")
      user.valid?
      expect(user.errors.full_messages).to include("first_name_kana can't be blank")
    end
    it "second_name_kanaが空では登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "",date_of_birth: "2001", "12" , "11")
      user.valid?
      expect(user.errors.full_messages).to include("second_name_kana can't be blank")
    end
    it "date_of_birthが空では登録できない" do
      user = User.new(nick_name: "abe", email: "kk@gmail.com", encrypted_password: "abc123", password_confirmation: "abc123",first_name: "太郎",second_name: "田中",first_name_kana: "タロウ",second_name_kana: "タナカ",date_of_birth: "")
      user.valid?
      expect(user.errors.full_messages).to include("date_of_birth can't be blank")
    end
   end
 end
