class SessionsController < ApplicationController
    def new #login page
        render :new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )
        if @user
            login!(@user)
            redirect_to bands_url
        else
            flash[:errors] = ["Email or password is incorrect, please try again"]
            redirect_to new_session_url #new session 
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

end