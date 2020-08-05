class EventsController < ApplicationController
    before_action :current_user 
    #before_action :set_event, only: [:show, :edit, :update, :destroy]

    def show
      @event = Event.find(params[:id])
      @user = current_user
      #@event = Event.all
    end
  
    def index
      @user = current_user
      @event = Event.all
    end
  
    def new
      @user = current_user
      @event = Event.new
    end
  
    def create
      @user = current_user
      @event = @user.events.build(event_params)

       if @event.save  
          redirect_to user_path(@user)
          #format.json { render :show, status: :created, location: @post }
       else
          render :new
          #format.json { render json: @post.errors, status: :unprocessable_entity }
       end
      #event = Event.create(event_params)
      #redirect_to event
    end
  
    private
  
    def event_params
      params.require(:event).permit(:name, :date, :city, :artist, :venue, user_ids:[])
    end
  end