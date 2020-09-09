class UsersController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]
    def new
        render :new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:user_name, :password_digest, :session_token)
    end
end

