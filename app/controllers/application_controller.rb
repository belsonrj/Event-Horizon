class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    helper_method :authenticate_user!
    
    def current_user
       User.find_by(id: session[:user_id])
    end
    
    def logged_in?
       !current_user.nil?
    end

    def authorized
       redirect_to '/' unless logged_in?
    end

    protected
    def authenticate_user!
      redirect_to root_path, notice: "You must login" unless logged_in? 
    end

end
