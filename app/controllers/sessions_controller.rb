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
    @user = User.find_by(:username => params[:username])
    @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)

  end


  def destroy
    if session[:user_id].present?
      session.delete :user_id
    end
    redirect_to '/'
  end

  private

  #def set_user
  #  @user = User.find_by
  #end
end