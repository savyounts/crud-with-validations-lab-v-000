class SongsController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

    def song_params 
      params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    def set_song
      @song = Song.find(params[:id])
    end
end
