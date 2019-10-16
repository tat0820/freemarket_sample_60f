class ProductsController < ApplicationController

  def index
    @products = Product.all.order("id DESC")
  end

  def new
  end
  
  def show
    @product = Product.find(params[:id])
    # @detail = Detail.find(params[:id])
    # @image = Image.find(params[:id])
  end

end
