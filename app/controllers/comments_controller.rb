class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @worry = Worry.find(params[:worry_id])
    if @comment.save
      CommentChannel.broadcast_to @worry, { comment: @comment, user: @comment.user } 
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:answer).merge(user_id: current_user.id, worry_id: params[:worry_id])
  end

end
