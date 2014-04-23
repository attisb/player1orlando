class CategoriesController < ApplicationController
  
  def index
    @drink_dispense_styles = Drink::DISPENSE_TYPE
    @drink_update_styles = Drink::UPDATE_STYLES
  end
    
  def show_by_dispense_type
    @dispense_type_name = Drink::DISPENSE_TYPE.invert
    @drinks = Drink.where(:dispense_type => params[:dispense_type]).order(name: :asc)
    if admin_signed_in?
      @all_hidden = Drink.where(:visible => false).order(name: :asc).limit(10)
    end
  end
  
end