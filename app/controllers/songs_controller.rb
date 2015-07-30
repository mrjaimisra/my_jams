class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
    session[:most_recent_song_title] = Song.last.title
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    # Song.create song_params

    # @song = Song.new
    # if song.save
    #   ...
    # end


    @song = Song.new(song_params)


    if @song.save
      flash[:notice] = "You successfully created a song"
    else
      flash[:error] = @song.errors.full_messages.first
    end

    redirect_to songs_path
  end

  def edit
  end

  def update
    @song.update(song_params)

    redirect_to songs_path
  end

  def destroy
    @song.destroy

    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end

  def set_song
    @song = Song.find(params[:id])
  end

end