require 'rails_helper'

describe User do
  describe '#create' do

    it "nickname,email,password,password_confirmation,birthday_year,birthday_month,birthday_day,
    last_name,first_name,last_name_kana,first_name_kana,card_number,card_limit_year,card_limit_month,
    security_codeが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameが空では登録出来ないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "emailが空では登録出来ないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "passwordが空では登録出来ないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "password_confirmationが空では登録出来ないこと" do
      user = build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end

    it "last_nameが空では登録出来ないこと" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "first_nameが空では登録出来ないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "last_name_kanaが空では登録出来ないこと" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    it "first_name_kanaが空では登録出来ないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "card_numberが空では登録出来ないこと" do
      user = build(:user, card_number: nil)
      user.valid?
      expect(user.errors[:card_number]).to include("can't be blank")
    end

    it "card_limit_yearが空では登録出来ないこと" do
      user = build(:user, card_number: nil)
      user.valid?
      expect(user.errors[:card_number]).to include("can't be blank")
    end

    it "card_limit_yearが空では登録出来ないこと" do
      user = build(:user, card_number: nil)
      user.valid?
      expect(user.errors[:card_number]).to include("can't be blank")
    end

    it "card_limit_monthが空では登録出来ないこと" do
      user = build(:user, birthday_year: nil)
      user.valid?
      expect(user.errors[:birthday_year]).to include("can't be blank")
    end

    it "birthday_monthが空では登録出来ないこと" do
      user = build(:user, birthday_month: nil)
      user.valid?
      expect(user.errors[:birthday_month]).to include("can't be blank")
    end

    it "birthday_dayが空では登録出来ないこと" do
      user = build(:user, birthday_day: nil)
      user.valid?
      expect(user.errors[:birthday_day]).to include("can't be blank")
    end

    it "パスワードが7文字以上であれば登録できること" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it "パスワードが6文字以下であれば登録できないこと" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end

  end
end