class ProductsController < ApplicationController
  def index
    @prefectures = Prefecture.all
  end

  def signup
  end



end
