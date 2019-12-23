class SignupController < ApplicationController
  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password]
    session[:last_name] = user_params[:last_name]
    session[:fast_name] = user_params[:fast_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:fast_name_kana] = user_params[:fast_name_kana]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]
    @user = User.new # 新規インスタンス作成

  end

  def step3
    # step2で入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
    @user.build_address
  end


  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      fast_name: session[:fast_name], 
      last_name_kana: session[:last_name_kana], 
      fast_name_kana: session[:fast_name_kana], 
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      phone_number: session[:phone_number]
    )
    @user.build_address(user_params[:address_attributes])
    if @user.save
      # ログインするための情報を保管
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to step4_signup_index_path
    else
      render '/signup/step1'
    end
  end


  private

# 許可するキーを設定します
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password,
      :password_confirmation, 
      :last_name, 
      :fast_name, 
      :last_name_kana, 
      :fast_name_kana, 
      :phone_number,
      :birth_year,
      :birth_month,
      :birth_day,
      address_attributes: [:id, :postal_code, :prefecture_id, :city, :address, :building_name,:phone_number]
    )
  end
end