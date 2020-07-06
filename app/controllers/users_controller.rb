class UsersController < ApplicationController
  before_action :require_login
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:user_id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    #respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
        #format.html { redirect_to @user, notice: 'User was successfully created.' }
        #format.json { render :show, status: :created, location: @user }
      else
        render :new
        #format.html { render :new }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    #end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password)
    end

    def require_login
      return head(:forbidden) unless session.include? :user_id
    end
end
