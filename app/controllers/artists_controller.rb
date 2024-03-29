class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :current_user

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
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to users_path(@user), alert: "No Artist Found"
    else
      @artist = Artist.new(user_id: params[:user_id])
    end
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
    @venue = Venue.create(params.require(:venue).permit(:name, :locale, :venue_type, :layout, :sound, :comfort, :prices, :content))
    @artist = Artist.create(artist_params)

    @user.artists << @artist

    if !params["venue"]["name"].empty?
      @venue.save
      @artist.venues << @venue
      @user.venues << @venue
    end
    if @artist.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    @user = current_user
    @artist = Artist.find(params[:id])
    @venue = Venue.create(venue_params)

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
    @artist_met = current_user.artists.artists_met
  end

  #def delete
  #  artist = Artist.find(params[:id])
  #  venues = artist.venues.find(params[:venue_id])
  #  artist.venues.delete(params[:venue_id])
  #end


  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @user = current_user
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to user_path(@user)

  end

  

  private
    
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :genre, :times_seen, :met, :venue_ids => [])
    end

    def venue_params
      params.require(:venue).permit(:name, :locale)
    end

end
