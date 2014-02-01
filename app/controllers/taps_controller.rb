class TapsController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]

  total_taps = 5

  def index
    @total_taps = total_taps
  end
  
end
