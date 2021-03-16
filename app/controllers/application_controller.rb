class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
#    around_action :handle_exceptions, if: proc { request.path.include?('/') }
    
    def current_user
       User.find_by(id: session[:user_id])
    end
    
    def logged_in?
       !current_user.nil?
    end

    def authorized
       redirect_to '/' unless logged_in?
    end

#    def handle_exceptions
#      begin
#        yield
#      rescue ActiveRecord::RecordNotFound => e
#        @status = 404
#        @message = 'Record not found'
#      rescue ActiveRecord::RecordInvalid => e
#        render_unprocessable_entity_response(e.record) && return
#      rescue ArgumentError => e
#        @status = 400
#      rescue StandardError => e
#        @status = 500
#      end
#      json_response ({ success: false, message: @message || e.class.to_s, errors: [{ detail: e.message }] }, @status) unless e.class == NilClass
#    end

end
