class TracksController < ApplicationController
  
  before_action :require_user!
  
  def new
    album = Album.find(params[:album_id]) #why does it come back as album_id, instead of params[:album][:id]?
    @track = album.tracks.new
    render :new
  end
  
  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end
  
  def show
    @track = Track.find(params[:id])
    render :show
  end
  
  #make sure to redirect after each controller action
  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to track_url(@track.track_id)
  end
  
  def edit
    @track = Track.find(params[:id])
    render :edit
  end
  
  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end
  
  def track_params
    params.require(:track).permit(:name, :album_id, :track_type, :lyrics)
  end
  
end
