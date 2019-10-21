require 'rails_helper'

describe ProductsController do
  let(:user) { create(:user) }

  describe 'GET #index' do

    it "indexビューが呼ばれているか" do
      get :index
      expect(response).to render_template :index
    end

    it "@productsに正しい値が入っているか" do
      products = create_list(:product, 3)
      get :index
      expect(assigns(:products)).to match(products.sort{ |a, b| b.created_at <=> a.created_at })
    end

  end

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    it "productテーブルにレコードが保存できたか" do
      product = build(:product)
      expect{create :product}.to change(Product, :count).by(1)
    end
  end

  describe 'GET #show' do
    it "renders the :show template" do
      product = create(:product)
      get :show, params: { id: product }
      expect(response).to render_template :show
    end
  end

  describe 'DELETE #destroy' do
    it "productテーブルのレコードが削除できたか" do
      product = create(:product)
      # binding.pry
      expect{
        delete :destroy, id: product.id
      }.to change(Product,:count).by(-1)
      # 以下復習用
      # post :destroy params: {id: product}
      # expect{desroy :product}.to change(Product, :count).by(-1)
      # expect{delete :destroy, product}.to change(Product, :count).by(-1)
    end
  end
end