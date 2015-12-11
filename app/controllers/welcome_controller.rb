class WelcomeController < ApplicationController
  def index
    @comment = Comment.new
    @user_comments = Comment.where(charity?: false)
    @charities = Comment.where(charity?: true)
  end

  def about
  end

end