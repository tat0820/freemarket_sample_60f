class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:user_buying, :pay]

  def index
    @products = Product.all.order("id DESC")
  end

  def new
    @product = Product.new
<<<<<<< HEAD
=======
    
    # @product.images.build
>>>>>>> 5148949a80301f56cff6e19046ccb17314988e5b
    3.times{@product.images.build}
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
    
    @product.images.build(
      img: params[:product][:images_attributes][:"0"][:img]
    )
    @product.images.build(
      img: params[:product][:images_attributes][:"1"][:img]
    )

    @product.images.build(
      img: params[:product][:images_attributes][:"2"][:img]
    )
      
    if @product.save
      redirect_to root_path
    else
      render "/products/new"
    end
  
  end 

  def show
  end

  def user_buying
  end


  def pay
    Payjp.api_key = ENV['PAYJPSK']
    charge = Payjp::Charge.create(
    :amount => @product.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
    @product.status = "取引中"
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
    :price
    )
  end
end