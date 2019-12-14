class RegistrationController < ApplicationController
  def index
    @user = User.new
  end

  def registration_information
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:encrypted_password ] = user_params[:encrypted_password]
    session[:last_name] = user_params[:last_name]
    session[:ast_name] = user_params[:ast_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:fast_name_kana] = user_params[:fast_name_kana]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]
    @user = User.new
  end

  def registration_active
    session[:phonenumber] = user_params[:phonenumber]
  end

  def registration_address
  end

  def registration_payment
  end

  def registration_complete
  end
end
