class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :update_sanitized_params, if: :devise_controller?

def update_sanitized_params
  devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :user_type, :password, :password_confirmation)}
end


  def set_current_user
  	Authorization.current_user = current_user
  end
end
