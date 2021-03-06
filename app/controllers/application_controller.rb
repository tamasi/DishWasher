class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:username, :email, :password, :password_confirmation, :user_avatar, organization_attributes: [:name])}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:username, :password, :password_confirmation, :user_avatar, :current_password)}
  end

  def authenticate_admin!
 	  redirect_to root_url unless current_user.is_admin?
  end
end
