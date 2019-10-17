class SignupController < ApplicationController
  before_action :validates_step2, only: :step3
  before_action :validates_step5, only: :step6
  before_action :validates_step6, only: :create

  def step1
  end

  def step2
    @user = User.new
  end

  def step3
    @user = User.new
  end

  def step4
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
  end

  def step5
    @user = User.new
    @user.build_address
  end

  def step6
    @user = User.new
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana],
      card_number: session[:card_number],
      card_limit_year: session[:card_limit_year],
      card_limit_month: session[:card_limit_month],
      security_code: session[:security_code],
      birthday_year: session[:birthday_year],
      birthday_month: session[:birthday_month],
      birthday_day: session[:birthday_day],
      phone_number: session[:phone_number]
    )
    @user.build_address(
      post_code: session[:post_code],
      prefecture: session[:prefecture],
      town: session[:town],
      street: session[:street],
      building_name: session[:building_name],
      user_id: session[:user_id]
    )
    if @user.save
      session[:id] = @user.id
      redirect_to "/signup/done"
    else
      render "/signup/step1"
    end

  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password, 
      :password_confirmation, 
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :birthday_year,
      :birthday_month,
      :birthday_day,
      :phone_number,
      :card_number,
      :card_limit_month,
      :card_limit_year,
      :security_code,
      :sales_money,
      :point,
      address_attributes:[:id, :post_code, :prefecture, :town, :street ,:building_name, :user_id]
    )
  end

  def validates_step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:birthday_year] = user_params[:birthday_year]
    session[:birthday_month] = user_params[:birthday_month]
    session[:birthday_day] = user_params[:birthday_day]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      birthday_year: session[:birthday_year],
      birthday_month: session[:birthday_month],
      birthday_day: session[:birthday_day],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana],
      card_number: "11111111",
      card_limit_year: "2020",
      card_limit_month: "3",
      security_code: "111"
    )
    @user.build_address(
      post_code: "111-1111",
      prefecture: "宮城県",
      town: "仙台市青葉区",
      street: "1-1-1",
      user_id: "1"
    )

    render '/signup/step2' unless @user.valid?
  end

  def validates_step5
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:phone_number] = user_params[:phone_number]
    session[:post_code] = user_params[:address_attributes][:post_code]
    session[:prefecture] = user_params[:address_attributes][:prefecture]
    session[:town] = user_params[:address_attributes][:town]
    session[:street] = user_params[:address_attributes][:street]
    session[:building_name] = user_params[:address_attributes][:building_name]
    session[:user_id] = user_params[:address_attributes][:user_id]

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      birthday_year: session[:birthday_year],
      birthday_month: session[:birthday_month],
      birthday_day: session[:birthday_day],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana],
      card_number: "11111111",
      card_limit_year: "2020",
      card_limit_month: "3",
      security_code: "111"
    )
    @user.build_address(
      post_code: session[:post_code],
      prefecture: session[:prefecture],
      town: session[:town],
      street: session[:street],
      user_id: session[:user_id]
    )

    render '/signup/step5' unless @user.valid?
  end

  def validates_step6
    session[:card_number] = user_params[:card_number]
    session[:card_limit_year] = user_params[:card_limit_year]
    session[:card_limit_month] = user_params[:card_limit_month]
    session[:security_code] = user_params[:security_code]

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      birthday_year: session[:birthday_year],
      birthday_month: session[:birthday_month],
      birthday_day: session[:birthday_day],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana],
      card_number: session[:card_number],
      card_limit_year: session[:card_limit_year],
      card_limit_month: session[:card_limit_month],
      security_code: session[:security_code]
    )
    @user.build_address(
      post_code: session[:post_code],
      prefecture: session[:prefecture],
      town: session[:town],
      street: session[:street],
      user_id: session[:user_id]
    )

    render '/signup/step6' unless @user.valid?
  end

end
