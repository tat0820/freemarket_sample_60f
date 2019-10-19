class ProductsController < ApplicationController

  def index
    @products = Product.all.order("id DESC")
  end

  def new
    @product = Product.new
    # @product.images.build
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
      status: "出品中"
      )
      
    # @product.images.build(
    #   img: product_params[:images_attributes][:img],
    #   product_id: product_params[:images_attributes][:product_id]
    #   )

    if @product.save
      redirect_to root_path
    else
      render "/products/new"
    end
    
  end 

  def show
    @product = Product.find(params[:id])
  end


  private
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
    # images_attributes: {img: []}
  end
end