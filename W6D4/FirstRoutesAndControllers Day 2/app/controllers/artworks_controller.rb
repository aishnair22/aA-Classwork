class ArtworksController < ApplicationController
    def index
        
        artworks = Artwork.all

        user = User.find_by(id: params[:user_id])
        if user.nil?
            render json: artworks
        else
            render json: user.artworks + user.shared_artworks
        end
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])
        if artwork.nil?
            render json: "Artwork doesn't exist.", status: 404
        else
            render json: artwork.destroy
        end
    end

    private
    def artwork_params
        params.require(:artwork).permit(:artist_id, :title, :image_url)
    end
end