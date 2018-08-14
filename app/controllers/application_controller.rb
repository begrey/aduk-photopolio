class ApplicationController < ActionController::Base
  before_action :authenticate_user!,  except: [:main]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    
    devise_parameter_sanitizer.permit(:sign_up, keys: [:sex])
    devise_parameter_sanitizer.permit(:account_update, keys: [:sex])
    
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthyear])
    devise_parameter_sanitizer.permit(:account_update, keys: [:birthyear])
    
    devise_parameter_sanitizer.permit(:sign_up, keys: [:region])
    devise_parameter_sanitizer.permit(:account_update, keys: [:region])
    
    devise_parameter_sanitizer.permit(:sign_up, keys: [:interest])
    devise_parameter_sanitizer.permit(:account_update, keys: [:interest])
    
    devise_parameter_sanitizer.permit(:sign_up, keys: [:kakao])
    devise_parameter_sanitizer.permit(:account_update, keys: [:kakao])
    
  end
end
