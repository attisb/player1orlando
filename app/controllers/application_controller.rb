class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  helper_method :citizen_allowed?, :get_user_rating
  helper_method :find_random_drink, :find_random_drinks, :find_untried_drinks
  before_filter :prepare_for_mobile
    
  before_filter :configure_devise_params, if: :devise_controller?
    def configure_devise_params
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
      end
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password, :membership_number)
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
    (user.points / 500) + 1
  end
  
  def find_untried_drinks(user)
    untried = Array.new
    fud_drinks = Drink.where(:visible => true)
    fud_tried = Tracker.where(:user_id => user.id)
    
    fud_drinks.each do |drink|
      unless fud_tried.where(:drink_id => drink.id).size > 0
        untried.push(drink)
      end
    end
    
    if untried.size == 0
      untried.push(fud_drink.sample)
    end
    
    untried
  end
  
  def find_random_drink(user)
    the_list = find_untried_drinks(user)    
    the_list.sample
  end

  def find_random_drinks(user, list_length)
    the_list = find_untried_drinks(user)    
    the_list.sample(list_length.to_i)
  end
  
  def after_sign_in_path_for(resource)
    root_path
  end
  
  private
  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  helper_method :mobile_device?

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end

end
