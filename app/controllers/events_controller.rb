class EventsController < ApplicationController
    before_action :current_user 

    def show
      @event = Event.find(params[:id])
      @user = current_user
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
      event = @user.events.build(event_params)
       if event.save  
          redirect_to user_path(@user)
       else
          render :new
       end
    end
  
    private
  
    def event_params
      params.require(:event).permit(:name, :date, :city, :artist, :venue, user_ids:[])
    end
  end