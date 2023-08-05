class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number])
  end

  def after_sign_in_path_for(resource)
   admin_path
  end

  def after_sign_out_path_for(resource_or_scope)
    admin_path
  end
end
