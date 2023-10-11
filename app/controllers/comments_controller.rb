class CommentsController < ApplicationController
  def index
    if params[:user_id].present?
      @comments = Comment.where(commenter_id: params[:user_id])
    else
      @comments = Comment.where(artwork_id: params[:artwork_id])
    end
    render json: @comments, status: :ok     
  end
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors.full_messages
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: @comment, status: :ok
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body, :commenter_id, :artwork_id)
  end  
end