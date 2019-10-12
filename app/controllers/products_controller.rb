class ProductsController < ApplicationController

  def index
    @products = Product.all.order("id DESC")
  end

  def new
  end

end
