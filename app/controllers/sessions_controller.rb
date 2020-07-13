class SessionsController < ApplicationController
  #skip_before_action :authorized, only: [:new, :create, :welcome]
  #before_action :set_user
  skip_forgery_protection
  
  def welcome
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]

      oauth_username = request.env["omniauth.auth"]["info"]["nickname"]
      if @user = User.find_by(:username => oauth_username)
        session[:user_id] = @user.id

        redirect_to user_path(@user)
      else  
        @user = User.create(:username => oauth_username, :password => SecureRandom.hex)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    else 
      @user = User.find_by(:username => params[:username])
      if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id
        
         redirect_to user_path(@user)
      else
        render 'sessions/welcome'
      end
    end
  end


  def destroy
    if session[:user_id].present?
      session.delete :user_id
    end
    redirect_to '/'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
  #def set_user
  #  @user = User.find_by
  #end
end