class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    def login!(user)
        session[:session_token] = user.reset_session_token
    end

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end    

    def logged_in?
        !!current_user
    end

    def logout!
        if logged_in?
            current_user.reset_session_token
        end
        session[:session_token] = nil
        @current_user = nil
    end
    

    def redirect_if_logged_in
        redirect_to cats_url if logged_in?
    end


end