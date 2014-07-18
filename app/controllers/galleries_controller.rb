class GalleriesController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  def index
  end

  def edit
  end

  def new
  end
  
  private
    def :set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit(:caption, :image)
    end

  
end
