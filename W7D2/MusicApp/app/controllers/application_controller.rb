class ApplicationController < ActionController::Base

    #CRLLL

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_in
        if !logged_in?
            redirect_to new_session_url 
        end
    end 

    def logged_in?
        !!current_user
    end

    def login!(user) #setting the cookie
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil 
        @current_user = nil
    end
end