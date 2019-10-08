class ProductsController < ApplicationController
  def index
    @prefectures = Prefecture.all
  end
end
