class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
    #index view
  end

  def show
    find_artist
    #show view
  end

  def new
    #new form view
  end

  def create
    find_artist
    @artist = Artist.create(artist_params)
    redirect_to artist_path(@artist)
  end

  def edit
    find_artist
    #edit form view
  end

  def update
    find_artist
    @artist.update(artist_params)
    redirect_to artist_path(@artist)
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :bio)
  end

  def find_artist
    @artist = Artist.find_by(id: params[:id])
  end

end
