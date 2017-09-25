class SongsController < ApplicationController

  def index
    @songs = Song.all
    #index view
  end

  def show
    find_song
    #show view
  end

  def new
    #new form view
  end

  def create
    find_song
    @song = Song.create(song_params)
    redirect_to song_path(@song)
  end

  def edit
    find_song
    #edit form view
  end

  def update
    find_song
    @song.update(song_params)
    redirect_to song_path(@song)
  end

  private
  def song_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end

  def find_song
    @song = Song.find_by(id: params[:id])
  end

end
