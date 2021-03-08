class UsersController < ApplicationController
  before_action :logged_in?
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
  end

  def met_most
    @user = User.met_most
  end

  private
 
    def set_user
      @user = User.find_by id: session[:user_id]
    end

    def user_params
      params.require(:user).permit(:username, :password)
    end

    def require_login
      return head(:forbidden) unless session.include? :user_id
    end
end
