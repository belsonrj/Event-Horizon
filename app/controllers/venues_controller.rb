class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

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
    @venue = Venue.create(params.require(:venue).permit(:name, :locale, :venue_type, :content))
    
    @venue.save
    @user.venues << @venue
    redirect_to user_path(@user)
  end

  # PATCH/PUT /venues/1
  # PATCH/PUT /venues/1.json
  def update
    @user = current_user
    @venue = Venue.find(params[:id])

    @venue.update(venue_params)
   
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venue_params
      params.require(:venue).permit(:name, :locale, :venue_type, :artist_ids => [], :artists_attributes => [:name])
    end
end
