class TapsController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_defaults

  def index
  end
  
  private
    def set_defaults
      @total_taps = total_taps
    end
  
end
