class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)

  end

end