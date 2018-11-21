class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :authenticate_employer!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    attributes = [:password, :password_confirmation, :current_password, :company_name, :contact_info, :image, :employer_website, :employer_bio, :employer_title]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
