class KatyCornersController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_katy_corner, only: [:show, :edit, :update, :destroy]

  def index
    @katy_corners = KatyCorner.order(created_at: :desc).limit(10)
  end
    
  def show
    @katy_corners = KatyCorner.offset(1).order(created_at: :desc).limit(10)
  end
  
  def new
    @katy_corner = KatyCorner.new
  end

  def create
    @katy_corner = KatyCorner.new(katy_corner_params)

    respond_to do |format|
      if @katy_corner.save
        format.html { redirect_to katy_corner_path(@katy_corner), notice: 'Entry was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @katy_corner.update(katy_corner_params)
        format.html { redirect_to katy_corner_path(@katy_corner), notice: 'Entry was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    @katy_corner.destroy
    respond_to do |format|
      format.html { redirect_to katy_corners_path }
    end
  end
  
  private
    def set_katy_corner
      @katy_corner = KatyCorner.find(params[:id])
    end

    def katy_corner_params
      params.require(:katy_corner).permit(:title, :brief, :body_document, :image1, :image2, :image3, :image4, :image5, :image6, :image7)
    end

end
