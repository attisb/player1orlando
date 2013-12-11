class TrackersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:index, :track, :point_track]

  def index
    @drinks = Drink.where(:visible => true, :tracker => true).includes(:ratings)
    @tried_drinks = Tracker.where(:user_id => @user.id).includes(:ratings, :beer_styles, :trackers)
  end
  
  def track
    @drink = Drink.find(params[:id])
    @tracker = Tracker.new
    @tracker.user_id = @user.id
    @tracker.drink_id = params[:id]
    @tracker.points = 0
    if @tracker.save
      timeline = Timeline.create(
        :user_id => @user.id,
        :nature => "drink",
        :drink_id => @drink.id
      )

      redirect_to trackers_path, notice: 'Drink was successfully tracked. Your awesome!'
    else
      redirect_to drink_path(params[:id]), alert: "Something went wrong. :("
    end
      
    # redirect_to drink_path(params[:id])
  end
  
  def point_track
    @emp_user = User.where(:emp_code => params[:code]).first
    @drink = Drink.find(params[:id])
    
    unless @emp_user.nil? && @drink.tracker?
      @tracker = Tracker.new
      @tracker.user_id = @user.id
      @tracker.drink_id = @drink.id
      @tracker.points = @drink.price
      if @tracker.save
        new_point_balance = @user.lifetime_points + @drink.price
        @user.update(:lifetime_points => new_point_balance)

        timeline = Timeline.create(
          :user_id => @user.id,
          :nature => "drink",
          :drink_id => @drink.id
        )

        redirect_to trackers_path, notice: "WHAT!!!!! Drink was successfully tracked and you earned #{@drink.price} points for it too!"
      else
        redirect_to drink_path(params[:id]), alert: "Something went wrong. :("
      end
    else
      redirect_to drink_path(params[:id]), alert: "Something went wrong. :("
    end
    
  end

  private
    def set_user
      @user = User.includes(:ratings).find(current_user)
    end
    
    def track_params
      params.require(:tracker).permit()
    end
    

end
