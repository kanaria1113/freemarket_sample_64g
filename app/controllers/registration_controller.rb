class RegistrationController < ApplicationController
  def registration_information
    @user = User.new
  end
  
  def registration_active
    @user = User.new
  end
  
  def registration_active_create
    set_user_with_session
    @user[:phone_number] = user_params[:phone_number]
    if @user.save
      sign_in User.find(@user.id) unless user_signed_in?
      delete_session
      redirect_to registration_address_registration_index_path
    else
      render :registration_active
    end
  end
  
  def registration_address
    @address = Address.new
  end

  def registration_address_add
    @address = set_address(address_params)
    @address.valid?
    if @address.errors.messages.blank? && @address.errors.details.blank?
      create_session_address(address_params)
    else
      render :registration_address
    end
    if @address.save
      redirect_to registration_complete_registration_index_path
    else
      rnder :registration_address_add
    end
  end

  def registration_payment
    @card = Card.new
  end

  def registration_complete
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password_confirmation,
      :last_name,
      :fast_name,
      :last_name_kana,
      :fast_name_kana,
      :birth_year,
      :birth_month,
      :birth_day,
      :phone_number
      )
  end
  
  def set_user_when_email(user_params)
    User.new(
      nickname: user_params[:nickname],
      email: user_params[:email],
      password: user_params[:password_confirmation],
      password_confirmation: user_params[:password_confirmation],
      last_name: user_params[:last_name],
      fast_name: user_params[:fast_name],
      last_name_kana: user_params[:last_name_kana],
      fast_name_kana: user_params[:fast_name_kana],
      birth_year: user_params[:birth_year],
      birth_month: user_params[:birth_month],
      birth_day: user_params[:birth_day]
    )
  end

  def set_user_with_session
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password_confirmation],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      fast_name: session[:fast_name],
      last_name_kana: user_params[:last_name_kana],
      fast_name_kana: user_params[:fast_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day]
    )
  end

  def create_session(user_params)
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password_confirmation]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:fast_name] = user_params[:fast_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:fast_name_kana] = user_params[:fast_name_kana]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]
  end

  def delete_session
    session.delete(:nickname)
    session.delete(:email)
    session.delete(:password_confirmation)
    session.delete(:last_name)
    session.delete(:fast_name)
    session.delete(:last_name_kana)
    session.delete(:fast_name_kana)
    session.delete(:birth_year)
    session.delete(:birth_month)
    session.delete(:birth_day)
  end

  def address_params
    params.require(:address).permit(
      :postal_code,
      :prefectures,
      :city,
      :address,
      :building_name
    )
  end

  def set_address(address_params)
    Address.new(
      postal_code: address_params[:postal_code],
      prefectures: address_params[:prefectures],
      city: address_params[:city],
      address: address_params[:address],
      building_name: address_params[:building_name]
    )
  end

  def create_session_address(addres_params)
    session[:postal_code] = user_params[:postal_code]
    session[:prefectures] = user_params[:prefectures]
    session[:city] = user_params[:city]
    session[:address] = user_params[:address]
    session[:building_name] = user_params[:building_name]
  end

  def card_params
    params.require(:card).permit(
      :number,
      :month,
      :year,
      :name,
      :cvc
    )    
  end
end
