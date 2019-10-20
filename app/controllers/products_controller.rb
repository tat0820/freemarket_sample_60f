class ProductsController < ApplicationController

  def index
    @products = Product.all.order("id DESC")
  end

  def new
    @product = Product.new
    10.times{@product.images.build}
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
    @product.images.build(
      img: params[:product][:images_attributes][:"3"][:img]
    )
    @product.images.build(
      img: params[:product][:images_attributes][:"4"][:img]
    )
    @product.images.build(
      img: params[:product][:images_attributes][:"5"][:img]
    )
    @product.images.build(
      img: params[:product][:images_attributes][:"6"][:img]
    )
    @product.images.build(
      img: params[:product][:images_attributes][:"7"][:img]
    )
    @product.images.build(
      img: params[:product][:images_attributes][:"8"][:img]
    )
    @product.images.build(
      img: params[:product][:images_attributes][:"9"][:img]
    )
    @product.save
    redirect_to root_path
  end 

  def show
    @product = Product.find(params[:id])
  end

  def user_buying
    @product = Product.find(params[:id])
  end

  # ↓↓ここでいい？↓↓
  # def pay
  #   Payjp.api_key = 'sk_test_97aebb6be695bba58735b8a5'
  #   charge = Payjp::Charge.create(
  #   :amount => @product.price,
  #   :card => params['payjp-token'],
  #   :currency => 'jpy',
  #   )
  # end

  private
  def product_params
    params.require(:product).permit(
    :name, 
    :discription, 
    :condition, 
    :delivery_charge, 
    :days_left_send,
    :origin_area,
    :price,
    )
  end
end