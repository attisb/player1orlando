class CategoriesController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy, :allhidden]
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @cat_type = params[:area]
    @categories = Category.where(:area => params[:area]).order(order: :asc, name: :asc)
    if admin_signed_in?
      if @cat_type == "drinks"
        @all_hidden = Drink.where(:visible => false).order(name: :asc).limit(10)
      else
        @all_hidden = Game.where(:visible => false).order(name: :asc).limit(10)
      end
    end
  end

  def allhidden
    @cat_type = params[:area]
    if admin_signed_in?
      if @cat_type == "drinks"
        @all_hidden = Drink.where(:visible => false).order(name: :asc)
      else
        @all_hidden = Game.where(:visible => false).order(name: :asc)
      end
    end
  end

  def show
    if admin_signed_in?
      if @cat_type == "drinks"
        @all_hidden = Drink.where(:visible => false).order(name: :asc).limit(10)
      else
        @all_hidden = Game.where(:visible => false).order(name: :asc).limit(10)
      end
    end
  end

  def new
    @category = Category.new(:area => params[:area], :visible => true)
  end
  
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_path(@category), notice: 'Category was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_path(@category), notice: 'Category was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
    end
  end
  
  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :description, :visible, :order, :area)
    end
  
end
