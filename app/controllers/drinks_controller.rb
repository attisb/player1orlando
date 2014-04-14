class DrinksController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_drink, only: [:show, :tvscreen, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @drinks = Drink.text_search(params[:query])
    else
      redirect_to beverages_path
    end
  end
  
  def show
    if user_signed_in?
      @user = User.find(current_user)
      @drink_rating = @user.ratings.where(:drink_id => @drink).first
    end
  end

  def tvscreen
  end

  def new
    @drink = Drink.new(:category_id => params[:category_id], :visible => true)
  end
  
  def create
    @drink = Drink.new(drink_params)
    @drink.average = 0

    respond_to do |format|
      if @drink.save
        format.html { redirect_to edit_drink_path(@drink), notice: 'Drink was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @drink.update(drink_params)
        format.html { redirect_to edit_drink_path(@drink), notice: 'Drink was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    @drink.destroy
    respond_to do |format|
      format.html { redirect_to beverages_path }
    end
  end
  
  private
    def set_drink
      @drink = Drink.find(params[:id])
    end

    def drink_params
      params.require(:drink).permit(:name, :brewery, :abv, :description, :brewer_description, :price, :visible, :beer_style_id, :category_id, :call_out, :tracker, :drink_image, :image_tv, :remote_drink_image_url)
    end
  
  
end
