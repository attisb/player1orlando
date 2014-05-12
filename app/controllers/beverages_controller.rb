class BeveragesController < ApplicationController
  layout "print", :only => [ :show_by_printable ]
  
  def index
    @drink_dispense_styles = Drink::DISPENSE_TYPE
    @drink_update_styles = Drink::UPDATE_STYLES.except("4")
  end
    
  def show_by_dispense_type
    @dispense_type_name = Drink::DISPENSE_TYPE.invert
    
    if @dispense_type_name[params[:dispense_type]].blank?
      redirect_to beverages_path
    else    
      @drinks = Drink.where(:dispense_type => params[:dispense_type]).order(name: :asc)
      if admin_signed_in?
        @all_hidden = Drink.where(:visible => false).order(name: :asc).limit(10)
      end
    end
  end
  
  def show_by_update_style
    @update_style_name = Drink::UPDATE_STYLES.invert

    if @update_style_name[params[:update_style]].blank?
      redirect_to beverages_path
    else    
      @drinks = Drink.where(:quick_style => params[:update_style]).order(name: :asc)
      if admin_signed_in?
        @all_hidden = Drink.where(:visible => false).order(name: :asc).limit(10)
      end
    end
  end
  
  def show_by_printable
    @dispense_type_name = Drink::DISPENSE_TYPE.invert
    if @dispense_type_name[params[:dispense_type]].blank?
      redirect_to beverages_path
    else
      if params[:group] == "true"
        @drinks = Drink.where(:visible => true).where(:dispense_type => params[:dispense_type]).order(quick_style: :asc, name: :asc)
        unless params[:dispense_type2].blank?
          @drinks2 = Drink.where(:visible => true).where(:dispense_type => params[:dispense_type2]).order(quick_style: :asc, name: :asc)
        end
        unless params[:dispense_type3].blank?
          @drinks3 = Drink.where(:visible => true).where(:dispense_type => params[:dispense_type3]).order(quick_style: :asc, name: :asc)
        end
      else
        @drinks = Drink.where(:visible => true).where(:dispense_type => params[:dispense_type]).order(name: :asc)
        unless params[:dispense_type2].blank?
          @drinks2 = Drink.where(:visible => true).where(:dispense_type => params[:dispense_type2]).order(name: :asc)
        end
        unless params[:dispense_type3].blank?
          @drinks3 = Drink.where(:visible => true).where(:dispense_type => params[:dispense_type3]).order(name: :asc)
        end
      end
    end    
  end
  
  def show_by_printable_custom
    @dispense_type_name = Drink::DISPENSE_TYPE.invert
    @display_groups = params[:options].split(/,/)
    @drinks = Drink.where(:visible => true).order(quick_style: :asc, name: :asc)
  end
    
end