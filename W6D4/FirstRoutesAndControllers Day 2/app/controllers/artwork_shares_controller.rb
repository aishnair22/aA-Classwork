class ArtworkSharesController < ApplicationController
    def create
        share = ArtworkShare.new(artwork_shares_params)
        if share.save
            render json: share
        else
            render json: share.errors.full_messages, status: 422
        end
    end

    def destroy
        share = ArtworkShare.find_by(id: params[:id])
        if share.nil?
            render json: "Share doesn't exist.", status: 404
        else
            render json: share.destroy
        end
    end

    private
    def artwork_shares_params
        params.require(:artwork_share).permit(:viewer_id, :artwork_id)
    end
end