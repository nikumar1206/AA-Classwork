class CommentsController < ApplicationController
  def index
    user_comment = Comment.where(commenter_id: params[:user_id])
    artwork_comment = Comment.where(artwork_id: params[:artwork_id])
    if !user_comment.nil?
      render json: user_comment
    elsif !artwork_comment.nil?
      render json: artwork_comment
    else
      render json: 'THERE IS NO SUCH COMMENT!', status: :unprocessable_entity
    end
  end
  
  def create
    new_comment = Comment.new(comment_params)
    if new_comment.save
      render json: new_comment
    else
      render json: new_comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    deleted_comment = Comment.find(params[:id])
    deleted_comment.destroy
    redirect_to users_url
  end

  def comment_params
    params.require(:comments).permit(:artwork_id, :commenter_id, :body)
  end
end