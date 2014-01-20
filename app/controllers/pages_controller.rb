class PagesController < ApplicationController
  before_filter :authenticate_admin!, only: [:process_memberships]
  def index
    
    if admin_signed_in?
      @drinks = Drink.includes(:ratings).where(:visible => true)
      
      # @tracked = Tracker.where("created_at >= :start_date AND created_at <= :end_date", {start_date: Time.now.beginning_of_week, end_date: Time.now.end_of_week}).select(:drink_id).distinct.limit(20)
      @tracked = Tracker.where("created_at >= :start_date AND created_at <= :end_date", {start_date: Time.zone.now.beginning_of_week, end_date: Time.now.end_of_week}).select('drink_id, count(drink_id) as drinks_count').
      group('drink_id').
      order('drinks_count desc').limit(20)
    else
      # Event Gathering
      @current_events = Event.where(starts_at: (Time.zone.now.midnight - 1.day)..(Time.zone.now.midnight + 1.day)).limit(1)
    
      @generic_events = Event.where('ends_at >= :today_date', :today_date => Time.zone.now).where(
        "valid_sunday = ? OR valid_monday = ? OR valid_tuesday = ? OR valid_wednesday = ? OR valid_thursday = ? OR valid_friday = ? OR valid_saturday = ?",
        true, true, true, true, true, true, true
      ).limit(1)

      @upcoming_events = Event.where(starts_at: (Time.zone.now.midnight + 1.day)..(Time.zone.now.midnight + 7.days)).order(starts_at: :desc).limit(2)
    
      @day_generic_events = @generic_events.where("valid_#{Time.zone.now.strftime('%A').downcase}" => true)
      @current_events = @current_events + @day_generic_events + @upcoming_events
      
      # Katy's Corner
      @katy_corner = KatyCorner.order(created_at: :desc).first
      
      # Drink Call Outs
      @drinks = Drink.where(:visible => true, :call_out => true).limit(10)
      
    end
    
  end
  
  # /manual/citizens
  def rewards
  end
  
  # /manual/vips
  def vips
  end
  
  # /manual/rules
  def rules
  end
  
  def citizen_checkin
  end
  
  def leaderboard
    @members = User.where("membership_number <> ''").order(vip_membership_points: :desc).limit(20)
    @citizens = User.where("has_membership" => true).order(lifetime_points: :desc).limit(20)
  end
  
  def feed
    @katy_corners = KatyCorner.order(created_at: :desc).limit(10)
    respond_to do |format|
        format.rss { render :layout => false }
      end
  end
  
  def process_memberships
    #25250000000024,30
    
    inputString=params["raw_data"]
    @lines=inputString.split("\n")
    @lines.each do |l|
      each_line = l.split(",")
      
      id_number = each_line[0]
      point_amount = each_line[1].to_i
      id_number_last = "252500000" + id_number[id_number.length-5..-1].to_s
      
      vip_user_account = User.find_by_membership_number(id_number_last)
      unless vip_user_account.nil?
        vip_user_account.update_attributes(:vip_membership_points => point_amount)
      end
    end
    
    redirect_to leaderboard_path, notice: "Successfully imported membership data."
    
    
  end
end
