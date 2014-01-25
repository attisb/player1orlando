class GamesController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @games = Game.text_search(params[:query])
    else
      redirect_to play_path
    end
  end
  
  def show
    if user_signed_in?
      @user = User.find(current_user)
      @game_rating = @user.ratings.where(:game_id => @game).first
    end
  end

  def new
    @game = Game.new(:category_id => params[:category_id], :visible => true)
  end

  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to game_path(@game), notice: 'Game was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to edit_game_path(@game), notice: 'Game was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to play_path }
    end
  end
  
  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :description, :released_at, :developer, :publisher, :players, :trailer, :visible, :category_id, :cover_art, :remote_cover_art_url)
    end
end
