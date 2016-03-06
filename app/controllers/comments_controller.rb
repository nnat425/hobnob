class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    respond_to do |fmt|
      fmt.html { redirect_to root_path }
      fmt.json { render json: comment.to_json }
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
    if request.xhr?
      render "welcome/_comments_edit_form"
    else
      puts "Something failed"
    end
  end

  def update
    comment = Comment.find_by(id: params[:id])
    comment.update(comment_params)
    redirect_to root_path
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy
    redirect_to root_path
  end



  private

  def comment_params
    params.require(:comment).permit(:subtext,:body,:charity)

  end

end