class CommentsController < ApplicationController
  
  before_action :find_commentable

  def create
    @comment = @commentable.comments.new(comment_params.merge(user_id: current_user.id))
    if @comment.save
      redirect_back(fallback_location: fallback_location_path(@commentable),notice: 'Your comment was successfully posted!')
    else
      redirect_back(fallback_location: fallback_location_path(@commentable),notice: "Your comment wasn't posted!")
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def fallback_location_path(commentable)
    if commentable.class.to_s == 'Question'
      question_path(commentable)
    elsif commentable.commentable_type == 'Question'
      question_path(commentable.commentable_id)
    else
      fallback_location_path(Comment.find_by_id(commentable.commentable_id))
    end
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Question.find_by_id(params[:question_id]) if params[:question_id]
  end
end