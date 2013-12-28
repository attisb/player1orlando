class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :citizen_allowed?
    
  before_filter :configure_devise_params, if: :devise_controller?
    def configure_devise_params
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
      end
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password)
      end
    end
    
  def citizen_allowed?
    if Time.zone.now.strftime('%A').downcase == "friday" || Time.zone.now.strftime('%A').downcase == "saturday"
      false
    else
      true
    end
  end
  
  def get_user_rating(user)
    (user.points / 1000) + 1
  end

end
