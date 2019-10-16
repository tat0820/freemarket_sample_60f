require 'rails_helper'

describe SignupController do

  describe ' #step1' do
    it "step1ビューが呼ばれているか" do
      get :step1
      expect(response).to render_template :step1
    end
  end

  describe ' #step2' do
    it "step2ビューが呼ばれているか" do
      get :step2
      expect(response).to render_template :step2
    end
  end

  describe ' #step3' do
    it "step3ビューが呼ばれているか" do
      get :step3
      expect(response).to render_template :step3
    end
  end

  describe ' #step4' do
    it "step4ビューが呼ばれているか" do
      get :step4
      expect(response).to render_template :step4
    end
  end

  describe ' #step5' do
    it "step5ビューが呼ばれているか" do
      get :step5
      expect(response).to render_template :step5
    end
  end

  describe ' #step6' do
    it "step6ビューが呼ばれているか" do
      get :step6
      expect(response).to render_template :step6
    end
  end

  describe 'POST #create' do
    it "userテーブルにレコードが保存できたか" do
      user = build(:user)
      expect{create :user}.to change(User, :count).by(1)
    end
  end

  describe ' #done' do
    it "doneビューが呼ばれているか" do
      get :done
      expect(response).to render_template :done
    end
  end

end