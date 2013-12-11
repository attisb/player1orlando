class BeerStylesController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_beer_style, only: [:show, :edit, :update, :destroy]

  def index
    @beer_styles = BeerStyle.all
  end

  def show
  end

  def new
    @beer_style = BeerStyle.new
  end

  def edit
  end

  def create
    @beer_style = BeerStyle.new(beer_style_params)

    respond_to do |format|
      if @beer_style.save
        format.html { redirect_to @beer_style, notice: 'Beer style was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @beer_style.update(beer_style_params)
        format.html { redirect_to @beer_style, notice: 'Beer style was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @beer_style.destroy
    respond_to do |format|
      format.html { redirect_to beer_styles_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beer_style
      @beer_style = BeerStyle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beer_style_params
      params.require(:beer_style).permit(:name, :description)
    end
end
