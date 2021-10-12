class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.js
      else
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end
