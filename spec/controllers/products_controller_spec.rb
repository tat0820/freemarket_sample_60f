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

  describe 'GET #search' do
    it "searchビューが呼ばれているか" do
      get :search
      expect(response).to render_template :search
    end
  end

  describe 'DELETE #destroy' do
    let!(:product) { create(:product) }
    it "productテーブルのレコードが削除できたか" do
      # product = create(:product)
      expect{
        delete :destroy, params: {id: product.id}
      }.to change(Product,:count).by(-1)

    end
  end
  
  describe 'GET #pay' do
    it "payjpが登録できるか" do
      product = create(:product)
      post :pay, params: { id: product }
      expect(response).to render_template :pay
    end
  end

end