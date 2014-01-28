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
    fud_drinks = Drink.where(:visible => true)
    fud_tried = Tracker.where(:user_id => user.id)
    fud_untried = fud_drinks - fud_tried
    return fed_untried
  end
  
  def find_random_drink(current_user)
    @drinks = Drink.where(:visible => true, :tracker => true).includes(:ratings)
  end

end
