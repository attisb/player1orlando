class TapsController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_defaults

  def index
    @drinks = Drink.where(:visible => true)
  end
  
  private
    def set_defaults
      @total_taps = 5
    end
  
end
