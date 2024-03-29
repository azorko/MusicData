class NotesController < ApplicationController
  
  before_action :require_user!, only: [:destroy]
  
  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.save
    flash.now[:errors] = @note.errors.full_messages
    redirect_to track_url(@note.track_id)
  end
  
  def destroy
    @note = Note.find(params[:id])
    if @note.user_id != current_user.id
      render text: "Can only destroy your own note", status: :forbidden
    else
      @note.destroy
      redirect_to track_url(@note.track_id)
    end
  end
  
  def note_params
    params.require(:note).permit(:description, :track_id)
  end
  
end
