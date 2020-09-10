class TracksController < ApplicationController
    def show
        @track = Track.find_by(id: params[:id])
        render :show
    end

    def new
        @track = Track.new
        render :new
    end

    def create
        @track = Track.new(track_params)
        if @track.save!
            redirect_to track_url(@track)
        else
            render :new
        end
    end

    def edit
        @track = Track.find_by(id: params[:id])
        render :edit
    end

    def update
        @track = Track.find_by(id: params[:id])
        if @track.update(track_params)
            redirect_to track_url(@track)
        else
            render :edit
        end
    end

    def destroy
        @track = Track.find_by(id: params[:id])
        @album = @track.album
        @track.destroy
        redirect_to album_url(@album)
    end

    private
    def track_params
        params.require(:track).permit(:title, :ord, :album_id, :lyrics, :bonus_track?)
    end
end
