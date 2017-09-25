class GenresController < ApplicationController

  def index
    @genres = Genre.all
    #index view
  end

  def show
    find_genre
    #show view
  end

  def new
    #new form view
  end

  def create
    find_genre
    @genre = Genre.create(genre_params)
    redirect_to genre_path(@genre)
  end

  def edit
    find_genre
    #edit form view
  end

  def update
    find_genre
    @genre.update(genre_params)
    redirect_to genre_path(@genre)
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

  def find_genre
    @genre = Genre.find_by(id: params[:id])
  end

end
