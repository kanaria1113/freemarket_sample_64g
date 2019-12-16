class RegistrationController < ApplicationController
  def index
    @user = User.new
  end

  def registration_information
    session[:nickname] = user_paramus[:nickname]
    session[:email] = user_paramus[:email]
    session[:encrypted_password] = user_paramus[:encrypted_password]
    session[:last_name] = user_paramus[:last_name]
    session[:fast_name] = user_paramus[:fast_name]
    session[:last_name_kana] = user_paramus[:last_name_kana]
    session[:fast_name_kana] = user_paramus[:fast_name_kana]
    session[:birth_year] = user_paramus[:birth_year]
    session[:birth_month] = user_paramus[:birth_month]
    session[:birth_day] = user_paramus[:birth_day]
    @user = User.new
    # sessionに保存された値をインスタンスに渡す
    nickname: session[:nickname],
    email: session[:email],
    password_confirmation: session[:password_confirmation],
    last_name: session[:last_name],
    first_name: session[:first_name],
    last_name_kana: session[:last_name_kana],
    first_name_kana: session[:first_name_kana],
    birth_year: session[:birth_year],
    birth_month: session[:birth_month],
    birth_day: session[:birth_day],
  end

  def registration_active
    session[:phone_numbaer] = user_paramus[:phone_numbaer]
    @user = User.new
  end

  def registration_address
    session[:postal_code] = user_paramus[:postal_code]
    session[:prefectures] = user_paramus[:prefectures]
    session[:city] = user_paramus[:city]
    session[:address] = user_paramus[:address]
    session[:building_name] = user_paramus[:building_name]
    @user = User.new
  end

  # def registration_payment
  #   session[:] = user_paramus[:]カード番号
  #   session[:] = user_paramus[:]有効期限_月
  #   session[:] = user_paramus[:]有効期限_年
  #   session[:cvc] = user_paramus[:cvc]cvc
  #   @user = User.new
  # end

  def registration_complete
  end

  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 

    )
    if @user.save
    # ログインするための情報を保管
      session[:id] = @user.id
      redirect_to registration_complete_registration_index
    else
      render '/registration/index'
    end
  end
  def registration_complete
    sign_in User.find(session[:id]) unless user_signed_in?
  end
end
