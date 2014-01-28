module ApplicationHelper
  def avatar_url(user)
    default_url = "#{root_url}includes/default_avatar.png"
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=256&d=#{CGI.escape(default_url)}"
  end
  
  def mini_avatar_url(user)
    default_url = "#{root_url}includes/default_avatar.png"
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=32&d=#{CGI.escape(default_url)}"
  end
  
  def title(page_title)
    unless page_title.blank?
      content_for :title, "#{page_title.to_s} - "
    end
  end
  
  def star_view(score)
    if score == 5
      "<i class=\"fa fa-star\"></i><i class=\"fa fa-star\"></i><i class=\"fa fa-star\"></i><i class=\"fa fa-star\"></i><i class=\"fa fa-star\"></i>"
    elsif score == 4
      "<i class=\"fa fa-star\"></i><i class=\"fa fa-star\"></i><i class=\"fa fa-star\"></i><i class=\"fa fa-star\"></i><i class=\"fa fa-star-o\"></i>"
    elsif score == 3
      "<i class=\"fa fa-star\"></i><i class=\"fa fa-star\"></i><i class=\"fa fa-star\"></i><i class=\"fa fa-star-o\"></i><i class=\"fa fa-star-o\"></i>"
    elsif score == 2
      "<i class=\"fa fa-star\"></i><i class=\"fa fa-star\"></i><i class=\"fa fa-star-o\"></i><i class=\"fa fa-star-o\"></i><i class=\"fa fa-star-o\"></i>"
    elsif score == 1
      "<i class=\"fa fa-star\"></i><i class=\"fa fa-star-o\"></i><i class=\"fa fa-star-o\"></i><i class=\"fa fa-star-o\"></i><i class=\"fa fa-star-o\"></i>"
    else
      "<i class=\"fa fa-star-o\"></i><i class=\"fa fa-star-o\"></i><i class=\"fa fa-star-o\"></i><i class=\"fa fa-star-o\"></i><i class=\"fa fa-star-o\"></i>"
    end
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
    
    untried
  end
  
  def find_random_drink(user, list_length)
    the_list = find_untried_drinks(user)
    
    if list_length.present?
      the_list.sample(list_length.to_i)
    else
      the_list.sample
    end
  end

end
