class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?

#    def home
#      render json: {message: "Server is up!"}
#    end
    
    def current_user
       User.find_by(id: session[:user_id])
    end
    
    def logged_in?
       !current_user.nil?
    end

    def authorized
       redirect_to '/' unless logged_in?
    end

end
