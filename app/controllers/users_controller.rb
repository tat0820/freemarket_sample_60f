class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @category_parent = Category.where(ancestry: nil)
  end

  def logout
    @user = User.find(params[:id])
    @category_parent = Category.where(ancestry: nil)
  end

  def credit
    @user = User.find(params[:id])
    @category_parent = Category.where(ancestry: nil)
  end

  def credit_add
    @user = User.find(params[:id])
    @category_parent = Category.where(ancestry: nil)
  end

  def profile_edit
    @user = User.find(params[:id])
    @category_parent = Category.where(ancestry: nil)
  end

  def user_check
    @user = User.find(params[:id])
    @category_parent = Category.where(ancestry: nil)
    @prefectures = Prefecture.all
  end

  def appear_notice
    @user = User.find(params[:id])
    @category_parent = Category.where(ancestry: nil)
  end

  def appear_todo
    @user = User.find(params[:id])
    @category_parent = Category.where(ancestry: nil)
  end

  def appear_transation
    @user = User.find(params[:id])
    @category_parent = Category.where(ancestry: nil)
  end

  def appear_after_transation
    @user = User.find(params[:id])
    @category_parent = Category.where(ancestry: nil)
  end

end
