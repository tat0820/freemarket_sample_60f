class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def logout
    @user = User.find(params[:id])
  end

  def credit
    @user = User.find(params[:id])
  end

  def credit_add
    @user = User.find(params[:id])
  end

  def profile_edit
    @user = User.find(params[:id])
  end

  def user_check
    @user = User.find(params[:id])
    @prefectures = Prefecture.all
  end

  def appear_notice
    @user = User.find(params[:id])
  end

  def appear_todo
    @user = User.find(params[:id])
  end

  def appear_transation
    @user = User.find(params[:id])
  end

  def appear_after_transation
    @user = User.find(params[:id])
  end

end
