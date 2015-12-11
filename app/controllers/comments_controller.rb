class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    respond_to do |fmt|
      fmt.html { redirect_to root_path }
      fmt.json { render json: comment.to_json }
    end
  end

private

  def comment_params
    params.require(:comment).permit(:subtext,:body,:charity)

  end

end