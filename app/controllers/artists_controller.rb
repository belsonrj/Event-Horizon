class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  skip_forgery_protection

  # GET /artists
  # GET /artists.json
  def index
    @user = current_user
    @artist = Artist.find(params[:id])
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    @user = current_user
    @artist = Artist.find(params[:id])
  end

  # GET /artists/new
  def new
    @user = current_user
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
    @user = current_user
    @artist = Artist.find(params[:id])
  end

  # POST /artists
  # POST /artists.json
  def create
    @user = current_user
    @artist = Artist.create(params.require(:artist).permit(:name, :genre, :times_seen, :met))
    
    @artist.save
    @user.artists << @artist
    redirect_to user_path(@user)
    #else
      #format.html { render :new }
      #format.json { render json: @user.errors, status: :unprocessable_entity }
    #  render :new
    #end
  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    @user = current_user
    @artist = Artist.find(params[:id])

    @artist.update(artist_params)

    if @artist.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url, notice: 'Artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artist_params
      params.require(:artist).permit(:name, :genre, :times_seen, :met)
    end
end
