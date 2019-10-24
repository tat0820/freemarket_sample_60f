class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:user_buying, :pay]

  def index
    @product = Product.new
    @products = Product.all.order("id DESC")
    @category_parent = Category.where(ancestry: nil)
  end

  def new
    @product = Product.new
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    2.times{@product.images.build}
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
    @product.images.build(
      img: params[:product][:images_attributes][:"0"][:img]
    )

    @product.images.build(
      img: params[:product][:images_attributes][:"1"][:img]
    )
      

    if @product.save
      redirect_to root_path
    else
      render "/products/new"
    end
  end 

  def show
    @category_parent = Category.where(ancestry: nil)
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
    @products = Product.where('name LIKE(?)',"%#{@keyword}%").order("id ASC").limit(15)
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
    Payjp.api_key = ENV['PAYJPSK']
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