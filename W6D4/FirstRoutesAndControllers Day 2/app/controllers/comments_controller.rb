class CommentsController < ApplicationController
    def index
        comments = Comment.all
        # user = User.find_by(params[:user_id])
        # artwork = Artwork.find_by(params[:artwork_id])
        
        render json: comments
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: "Invalid entry", status: 422
        end
    end

    def destroy
        comment = find_by(id: params[:id])
        if comment.nil?
            render json: "Comment doesn't exist.", status: 404
        else
            render json: comment.destroy
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:author_id, :artwork_id, :body)
    end
end

