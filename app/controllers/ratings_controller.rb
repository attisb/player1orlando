class RatingsController < ApplicationController

  def set_rating
    unless current_user.nil?
      @user_score = params[:rating].to_i
  
      if @user_score <= 0
        @user_score = 1
      elsif @user_score > 5
        @user_score = 5
      end
    
      @rating = current_user.ratings.find_or_initialize_by_drink_id(params[:id])
      @rating.rating = @user_score.to_i
      if @rating.save
        
        has_voted = Timeline.where(user_id: current_user.id, drink_id: params[:id]).count
        if has_voted <= 1
          timeline = Timeline.create(
            :user_id => current_user.id,
            :nature => "drink_rate",
            :drink_id => params[:id]
          )
        end
        
        drink = Drink.find(params[:id])
        ratings = Rating.sum(:rating, :conditions => {:drink_id => drink.id})
        get_average = ratings.ceil
        drink.update(:average => get_average)
        
      end
    end
    redirect_to drink_path(params[:id])
  end

  def set_game_rating
    unless current_user.nil?
      @user_score = params[:rating].to_i
  
      if @user_score <= 0
        @user_score = 1
      elsif @user_score > 5
        @user_score = 5
      end
    
      @rating = current_user.ratings.find_or_initialize_by_game_id(params[:id])
      @rating.rating = @user_score.to_i
      if @rating.save

        has_voted = Timeline.where(user_id: current_user.id, game_id: params[:id]).count
        if has_voted <= 1
          timeline = Timeline.create(
            :user_id => current_user.id,
            :nature => "game_rate",
            :game_id => params[:id]
          )
        end
        
      end
    end
    redirect_to game_path(params[:id])
  end

end
