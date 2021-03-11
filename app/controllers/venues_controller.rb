class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  before_action :current_user
  skip_forgery_protection

  # GET /venues
  # GET /venues.json
  def index
    @venues = Venue.all
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
    @user = current_user
    @venue = Venue.find(params[:id])
  end

  # GET /venues/new
  def new
    @user = current_user
    @venue = Venue.new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to users_path(@user), alert: "No Venue Found"
    else
      @artist = Venue.new(user_id: params[:user_id])
    end
  end

  # GET /venues/1/edit
  def edit
    @user = current_user
    set_venue
  end

  # POST /venues
  # POST /venues.json
  def create
    @user = current_user
    @artist = Artist.create(artist_params)
    @venue = Venue.create(venue_params)
    
    @user.venues << @venue

    if !params["artist"]["name"].empty?
      @venue.artists << @artist
      @user.artists << @artist
    end
    if @venue.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  # PATCH/PUT /venues/1
  # PATCH/PUT /venues/1.json
  def update
    @user = current_user
    @artist = Artist.create(artist_params)
    @venue = Venue.find(params[:id])

    @venue.update(venue_params)

    if !params["artist"]["name"].empty?
      @venue.artists << @artist
      @user.artists << @artist
    end
    if @venue.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @user = current_user
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to user_path(@user)
  end

  def rating
    @user = current_user

    @venue_layout = current_user.venues.order_by_layout
    @venue_sound = current_user.venues.order_by_sound
    @venue_comfort = current_user.venues.order_by_comfort
    @venue_prices = current_user.venues.order_by_prices
  end

  private
 
    def set_venue
      @venue = Venue.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :genre, :times_seen, :met)
    end

    def venue_params
      params.require(:venue).permit(:name, :locale, :venue_type, :layout, :sound, :comfort, :prices, :content, :artist_ids => [])
    end
end
