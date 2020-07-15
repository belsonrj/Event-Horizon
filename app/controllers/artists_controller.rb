class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :current_user 
  #skip_forgery_protection

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
    @venue = Venue.create(params.require(:venue).permit(:name, :locale))
    @artist = Artist.create(artist_params)

    @user.artists << @artist

    if !params["venue"]["name"].empty?
      @artist.venues << @venue
      @user.venues << @venue
    end
    if @artist.save
      redirect_to user_path(@user)
    end
  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    @user = current_user
    @artist = Artist.find(params[:id])
    @venue = Venue.create(params.require(:venue).permit(:name, :locale))
    
    @artist.update(artist_params)
   
    if !params["venue"]["name"].empty?
      @artist.venues << @venue
      @user.venues << @venue
    end
    if @artist.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def met
    @user = current_user
    @artist_met = current_user.artists.select {|artist| artist.met == true} 
  end

  def delete
    #@venue.artists.delete(@artist)
    artist = Artist.find(params[:id])
    venues = artist.venues.find(params[:venue_id])
    artist.venues.delete(params[:venue_id])
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

    #def current_user
    #  User.find_by(id: session[:user_id])
    #end
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artist_params
      #params.require(:artist).permit(venue_ids: [])
      params.require(:artist).permit(:name, :genre, :times_seen, :met, :venue_ids => [])
    end
end
