class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #for image in devise use
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end
 
end

