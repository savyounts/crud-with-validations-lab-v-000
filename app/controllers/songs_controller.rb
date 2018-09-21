class SongsController < ApplicationController
  before_action :set_song, [:edit, :update, :show, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    if @song = Song.new(song_params)
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @song.destroy
    redirect_to :index
  end

  private
    def song_params
      params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

    def set_song
      @song = Song.find(params[:id])
    end
end
