class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def create
        # User.create(
        #     username: params[:username], 
        #     email: params[:email], 
        #     age: params[:age], 
        #     political_affiliation: params[:political_affiliation])
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        if user.nil?
            render json: "User doesn't exist.", status: 404
        else
            render json: user.destroy
        end
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end

end