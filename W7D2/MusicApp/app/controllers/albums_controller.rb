class AlbumsController < ApplicationController
    def show
        @album = Album.find_by(id: params[:id])
        @tracks = Track.all
        render :show
    end

    def new
        @album = Album.new
        render :new
    end

    def create
        @album = Album.new(album_params)
        if @album.save!
            redirect_to album_url(@album)
        else
            render :new
        end
    end

    def edit
        @album = Album.find_by(id: params[:id])
        render :edit
    end

    def update
        @album = Album.find_by(id: params[:id])
        if @album.update(album_params)
            redirect_to album_url(@album)
        else
            render :edit
        end
    end

    def destroy
        @album = Album.find_by(id: params[:id])
        @album.destroy
        redirect_to bands_url
    end

    private
    def album_params
        params.require(:album).permit(:title, :yr, :studio, :band_id)
    end
end
