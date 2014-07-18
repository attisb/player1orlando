class GalleriesController < ApplicationController
  before_filter :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  def index
    @galleries = Gallery.order(created_at: :desc).limit(40)
  end
    
  def show
  end
  
  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to gallery_path(@gallery), notice: 'Gallery Image was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to gallery_path(@gallery), notice: 'Gallery Image was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to gallery_path }
    end
  end
  
  private
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit(:caption, :image)
    end

  
end
