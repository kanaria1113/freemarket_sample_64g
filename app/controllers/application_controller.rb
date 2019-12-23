class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:last_name,:fast_name,:last_name_kana,:fast_name_kana,:birth_year,:birth_month,:birth_day,:phone_number])
  end

  # def after_sign_in_path_for(resource)
  #   registration_address_registration_index_path
  # end

  #誰が作成したかわかるまで保留
  protect_from_forgery

end
