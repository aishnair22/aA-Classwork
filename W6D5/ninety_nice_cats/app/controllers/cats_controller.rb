class CatsController < ApplicationController
    def index
        @cats = Cat.all 
        render :index
    end

    def show
        @kitty = Cat.find_by(id: params[:id])
        if @kitty
            render :show
        else    
            redirect_to cats_url
        end
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat.save
            redirect_to cat_url(@cat)
        else
            render @cat.errors.full_messages, status: 422
        end
    end

    def update
        @kitty = Cat.find_by(id: params[:id])
        if @kitty.update_attributes(cat_params)
            redirect_to cat_url(@kitty)
        else 
            render :edit
        end
    end

    def new
        @cat = Cat.new
        render :new
    end

    def edit
        @kitty = Cat.find_by(id: params[:id])
        render :edit
    end

    private
    def cat_params
        params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
    end
end

