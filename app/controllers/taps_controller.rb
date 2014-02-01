class TapsController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_defaults

  def index
    @drinks = Drink.where(:visible => true).all
  end
  
  def create
    @drink = Drink.find(params[:drink_id].to_i)
    @drink.tab_index = params[:tap_index].to_i
    
    if @drink.save
      redirect_to taps_path, notice: "Tap updated"
    else
      redirect_to taps_path, alert: "Something went wrong."
    end
  end
  
  def destroy
  end
  
  private
    def set_defaults
      @total_taps = 5
    end
  
end
