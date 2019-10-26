class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:user_buying, :pay]

  def index
    @product = Product.new
    @products = Product.all.order("id DESC")
    @category_parent = Category.where(ancestry: nil)
  end

  def new
    @product = Product.new
    10.times{@product.images.build}
    @product.build_detail
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find_by(name: "#{params[:child_name]}").children

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

    if params[:product][:images_attributes].present?
      for i in 0..9 do
        if params[:product][:images_attributes][:"#{i}"].present?
          @product.images.build(
            img: params[:product][:images_attributes][:"#{i}"][:img]
          )
        end
      end
    else
      @product.images.build(
        img: params[:product][:images_attributes]
      )
    end
    
    if @product.save
      redirect_to root_path
    else
      10.times{@product.images.build}
      render "/products/new"
    end
  end 

  def show
    @category_parent = Category.where(ancestry: nil)
    @user_products = Product.where(user_id: @product.user_id).limit(6)

    product_large_categorys = Detail.where(large_category: @product.detail.large_category).limit(6)

    @category_products = []
    product_large_categorys.each do |category|
      @category_products << Product.find(category.product_id)
    end

  end

  def update
    @product = Product.find(params[:id])
    if @product.user_id == current_user.id
      @product.update(product_params)
    end
    redirect_to "/"
  end

  def search
    @keyword = params[:keyword]
    @products = Product.where('name LIKE(?)',"%#{@keyword}%").limit(15)
    @all_products = Product.all
  end

  def user_buying
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to("/")
  end
    
  def pay
    Payjp.api_key = Rails.application.credentials.PAYJPSK
    binding.pry
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