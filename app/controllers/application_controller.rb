class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :is_authenticate
    
    def is_authenticate
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
      
    def authorize
        redirect_to '/login' unless is_authenticate
    end
end
