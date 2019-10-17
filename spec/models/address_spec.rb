require 'rails_helper'

describe Address do
  describe '#create' do

    it "post_code,prefecture,town,street,user_idが存在すれば登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "post_codeが空では登録出来ないこと" do
      address = build(:address, post_code: nil)
      address.valid?
      expect(address.errors[:post_code]).to include("can't be blank")
    end

    it "prefectureが空では登録出来ないこと" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("can't be blank")
    end

    it "townが空では登録出来ないこと" do
      address = build(:address, town: nil)
      address.valid?
      expect(address.errors[:town]).to include("can't be blank")
    end

    it "streetが空では登録出来ないこと" do
      address = build(:address, street: nil)
      address.valid?
      expect(address.errors[:street]).to include("can't be blank")
    end

  end
end