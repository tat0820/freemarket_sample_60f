class ProductsController < ApplicationController

  def index
    @products = Product.all.order("id DESC")
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
    @product = Product.find(params[:id])
  end

  def user_buying
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
    :price,
    detail_attributes:[:id, :large_category, :medium_category, :small_category]
    )
  end
end