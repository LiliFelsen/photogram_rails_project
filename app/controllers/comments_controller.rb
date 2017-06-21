class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to picture_path(@comment.picture)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_path(current_user)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :picture_id)
  end

end
