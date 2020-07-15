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
    @artist = Artist.create(params.require(:artist).permit(:name, :genre))
    @venue = Venue.create(venue_params)
    
    @user.venues << @venue

    if !params["artist"]["name"].empty?
      @venue.artists << @artist
      @user.artists << @artist
    end
    if @venue.save
      redirect_to user_path(@user)
    end
  end

  # PATCH/PUT /venues/1
  # PATCH/PUT /venues/1.json
  def update
    @user = current_user
    @venue = Venue.find(params[:id])
    @artist = Artist.create(params.require(:artist).permit(:name, :genre))

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

    @venue_layout = current_user.venues.select {|venue| venue.layout >= 4}
    @venue_sound = current_user.venues.select {|venue| venue.sound >= 4}
    @venue_comfort = current_user.venues.select {|venue| venue.comfort >= 4}
    @venue_prices = current_user.venues.select {|venue| venue.prices >= 4}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venue_params
      params.require(:venue).permit(:name, :locale, :venue_type, :layout, :sound, :comfort, :prices, :content, :artist_ids => [])
    end
end
