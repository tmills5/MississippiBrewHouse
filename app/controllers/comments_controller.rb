class CommentsController < ApplicationController
    wrap_parameters format: []

    
    def index
        if params[:brewery_id]
            brewery = Brewery.find(params[:brewery_id])
            comments = brewery.comments
        else
            comments = Comment.all
        end
        render json: comments, status: :ok
    end

    def show
        comment = Comment.find(params[:id])
        if comment
            render json: comment
        else
            render json: {error: "Comment Not Found"}, status: :not_found
        end
    end

    def create
        # byebug
        comment = Comment.create!(comment_params)
        render json: comment, status: :created
    end

    def update
        comment = Comment.find(params[:id])
        if comment
            comment.update!(comment_params)
            render json: comment, status: :accepted
        else
            render json: {error: "Comment Not Found"}, status: :not_found
        end
    end


    def destroy
        comment = Comment.find(params[:id])
        if comment
            comment.destroy
            head :no_content
        else
            render json: {error: "Comment Not Found"}, status: :not_found
        end
    end

    private

    def comment_params
        params.permit(:comment_body, :user_id, :brewery_id)
    end 


end