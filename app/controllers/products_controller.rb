class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :user_buying, :update, :edit, :destroy, :pay,]

  def index
    @product = Product.new
    @category_parent = Category.where(ancestry: nil)

    @rady_products = []
    rady_category = Detail.where(large_category: "レディース").limit(10).order("id DESC")
    rady_category.each do |category|
      @rady_products << Product.find(category.product_id)
    end

    @men_products = []
    men_category = Detail.where(large_category: "メンズ").limit(10).order("id DESC")
    men_category.each do |category|
      @men_products << Product.find(category.product_id)
    end

    @machine_products = []
    machine_category = Detail.where(large_category: "家電・スマホ・カメラ").limit(10).order("id DESC")
    machine_category.each do |category|
      @machine_products << Product.find(category.product_id)
    end

    @hoby_products = []
    hoby_category = Detail.where(large_category: "おもちゃ・ホビー・グッズ").limit(10).order("id DESC")
    hoby_category.each do |category|
      @hoby_products << Product.find(category.product_id)
    end
  end

  def new
    @product = Product.new
    @product.images.build
    @product.build_detail
  end
  
  def create
    @product = Product.new(
      name: product_params[:name],
      discription: product_params[:discription],
      condition: product_params[:condition],
      delivery_charge: product_params[:delivery_charge],
      days_left_send: product_params[:days_left_send],
      origin_area: product_params[:origin_area],
      price: product_params[:price],
      user_id: current_user.id,
      status: "出品中"
      )
    @product.build_detail(
      large_category: product_params[:detail_attributes][:large_category],
      medium_category: product_params[:detail_attributes][:medium_category],
      small_category: product_params[:detail_attributes][:small_category]
    )

    if params[:images].present?
      params[:images][:img].each do |img|
        @product.images.build(img: img)
      end
    else
      @product.images.build(img: params[:images])
    end
    
    if @product.save
      redirect_to root_path
    else
      render "/products/new"
    end
  end 

  def show
    @category_parent = Category.where(ancestry: nil)
    @user_products = Product.where(user_id: @product.user_id).where.not(id: params[:id]).limit(6)

    product_large_categorys = Detail.where(large_category: @product.detail.large_category).where.not(product_id: params[:id]).limit(6)

    @product_parent = Category.find_by(name: @product.detail.large_category)
    if @product.detail.medium_category.present?
      @product_parent.children.each do |child|
        if child.name == @product.detail.medium_category
          @product_child = child
        end
      end
      if @product.detail.small_category.present?
        @product_child.children.each do |grandchild|
          if grandchild.name == @product.detail.small_category
            @product_grandchild = grandchild
          end
        end
      end
    end

    @category_products = []
    product_large_categorys.each do |category|
      @category_products << Product.find(category.product_id)
    end
  end

  def edit
    unless @product.user.id == current_user.id
      redirect_to "/products/#{@product.id}"
    end
    @product.images.build
  end

  def update
    if @product.user_id == current_user.id
      if params[:images].present?
        @product.images.each do |image|
          image.destroy
        end
        params[:images][:img].each do |img|
          @product.images.build(img: img)
        end
      end
      @product.update(product_params)
    end
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    if @product.user.id == current_user.id
      @product.destroy
    end
    redirect_to "/"
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find_by(name: "#{params[:child_name]}").children
  end

  def category_search_parent
    @category_parent = Category.where(ancestry: nil)
    @large_category = Category.find(params[:parent_id])
    
    large_categorys = Detail.where(large_category: @large_category.name).limit(120)
    @large_category_products = []
    large_categorys.each do |category|
      @large_category_products << Product.find(category.product_id)
    end
  end

  def category_search_child
    @category_parent = Category.where(ancestry: nil)
    @large_category = Category.find(params[:parent_id])
    @medium_category = Category.find(params[:child_id])
    
    medium_categorys = Detail.where(large_category: @large_category.name, medium_category: @medium_category.name).limit(120)
    @medium_category_products = []
    medium_categorys.each do |category|
      @medium_category_products << Product.find(category.product_id)
    end
  end

  def category_search_grandchild
    @category_parent = Category.where(ancestry: nil)
    @large_category = Category.find(params[:parent_id])
    @medium_category = Category.find(params[:child_id])
    @small_category = Category.find(params[:grandchild_id])
    
    small_categorys = Detail.where(large_category: @large_category.name, medium_category: @medium_category.name, small_category: @small_category.name).limit(120)
    @small_category_products = []
    small_categorys.each do |category|
      @small_category_products << Product.find(category.product_id)
    end
  end

  def search
    @keyword = params[:keyword]
    @products = Product.where('name LIKE(?)',"%#{@keyword}%").limit(120).order("id DESC")
    @all_products = Product.all.order("id DESC")
  end

  def user_buying
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
    
  def pay
    Payjp.api_key = Rails.application.credentials.PAYJPSK
    charge = Payjp::Charge.create(
    :amount => @product.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
    @product.status = "取引中"
    @product.buyer_id = current_user.id
    @product.save
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
    :name, 
    :discription, 
    :condition, 
    :delivery_charge, 
    :days_left_send,
    :origin_area,
    :price,
    detail_attributes:[:id, :large_category, :medium_category, :small_category]
    )
  end
end