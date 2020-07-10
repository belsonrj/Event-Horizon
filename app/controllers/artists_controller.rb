class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  #before_action :current_user 
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
    @artist = Artist.create(params.require(:artist).permit(:name, :genre, :times_seen, :met, venue_ids:[]))
   # @new_venue = Venue.create(name: params["venue"]["name"], locale: params["venue"]["locale"], venue_type: params["venue"]["venue_type"])
    #if !params["venue"]["name"].empty?
     # @artist.venues << @new_venue
      #@user.venues << @new_venue

      #@user.artists << @artist
      #@artist.save
    #else
    #@user.artists << @artist 
    #@artist.save
    #end
    #@user = current_user
    #@artist = Artist.create(artist_params)
    
    if @artist.save
       @user.artists << @artist
       redirect_to user_path(@user)
    end
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
    @user = current_user
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to user_path(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artist_params
      params.require(:artist).permit(:name, :genre, :times_seen, :met, venue_ids:[])
    end
end
