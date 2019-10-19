require 'rails_helper'

describe Product do
  describe '#create' do

    it "name, discription, condition, delivery_charge, days_left_send, origin_area, price, status,
    が存在すれば登録できること" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "nameが空では出品できないこと" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "nameが1文字以上であれば登録できること" do
      product = build(:product, name: "0")
      product.valid?
      expect(product).to be_valid
    end

    it "nameが40文字以上では登録できないこと" do
      product = build(:product, name: "00000000000000000000000000000000000000000000000000000000000")
      product.valid?
      expect(product.errors[:name][0]).to include("is too long (maximum is 40 characters)")
    end

    
    it "discriptionが空では出品できないこと" do
      product = build(:product, discription: nil)
      product.valid?
      expect(product.errors[:discription]).to include("can't be blank")
    end

    it "nameが1文字以上であれば登録できること" do
      product = build(:product, discription: "0")
      product.valid?
      expect(product).to be_valid
    end

    it "nameが1000文字以上では登録できないこと" do
      product = build(:product, discription: "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000")
      product.valid?
      expect(product.errors[:discription][0]).to include("is too long (maximum is 1000 characters)")
    end

    it "conditionが空では出品できないこと" do
      product = build(:product, condition: nil)
      product.valid?
      expect(product.errors[:condition]).to include("can't be blank")
    end

    it "delivery_chargeが空では出品できないこと" do
      product = build(:product, delivery_charge: nil)
      product.valid?
      expect(product.errors[:delivery_charge]).to include("can't be blank")
    end

    it "days_left_sendが空では出品できないこと" do
      product = build(:product, days_left_send: nil)
      product.valid?
      expect(product.errors[:days_left_send]).to include("can't be blank")
    end

    it "origin_areaが空では出品できないこと" do
      product = build(:product, origin_area: nil)
      product.valid?
      expect(product.errors[:origin_area]).to include("can't be blank")
    end

    it "priceが空では出品できないこと" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "priceが300円以上であれば出品できること" do
      product = build(:product, price: 300)
      product.valid?
      expect(product).to be_valid
    end

    it "priceが299円以下では出品できないこと" do
      product = build(:product, price: 299)
      product.valid?
      expect(product.errors[:price]).to include("must be greater than 299")
    end

    it "priceが999万円以下であれば出品できること" do
      product = build(:product, price: 9999999)
      product.valid?
      expect(product).to be_valid
    end

    it "priceが1000万円以下では出品できないこと" do
      product = build(:product, price: 10000000)
      product.valid?
      expect(product.errors[:price]).to include("must be less than 10000000")
    end

    it "priceが数字以外では出品できないこと" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("is not a number")
    end
  end
end