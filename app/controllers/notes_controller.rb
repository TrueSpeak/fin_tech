class NotesController < ApplicationController

  before_action :authenticate?
  before_action :set_note, only: [:show, :update, :edit, :destroy]
  before_action :can_write?, only: [:edit, :update, :destroy]

  def index
    @notes = Note.all.where(private_note: false).or(Note.all.where(private_note: true, user: current_user))
  end

  def show
  end

  def new
    @note = current_user.notes.new
  end

  def create
    @note = current_user.notes.new(note_params)
    @note.private_note = true if params[:note][:private_note_value] == '1'

    if @note.save
      redirect_to note_path(@note)
    else
      render :new
    end
  end

  def destroy
    @note.destroy

    redirect_to notes_path
  end

  def edit
  end

  def update
    private_note_value = true if params[:note][:private_note_value] == '1'

    if @note.update(note_params.merge(private_note: private_note_value))
      redirect_to note_path(@note)
    else
      render :edit
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
    return @note if @note.private_note == false
    return @note if @note.private_note == true && @note.user == current_user

    redirect_to notes_path, alert: 'Access denied. It is private Note'
  end

  def authenticate?
    return if signed_in?

    redirect_to root_path, alert: 'Access denied. You need to authorized'
  end

  def note_params
    params.require(:note).permit(:title, :description)
  end

  def can_write?
    return if @note.user == current_user

    redirect_to notes_path, alert: 'Access denied. You not owner of Note'
  end
end
