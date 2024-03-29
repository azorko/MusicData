class AlbumsController < ApplicationController
  
  before_action :require_user!
  
  def new
    band = Band.find(params[:band_id])
    @album = band.albums.new
    render :new
  end
  
  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end
  
  def show
    @album = Album.find(params[:id])
    render :show
  end
  
  #make sure to redirect after each controller action
  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to band_url(@album.band_id)
  end
  
  def edit
    @album = Album.find(params[:id])
    render :edit
  end
  
  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end
  
  def album_params
    params.require(:album).permit(:name, :band_id, :album_type)
  end
  
end
