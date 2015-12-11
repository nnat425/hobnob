class WelcomeController < ApplicationController
  def index
    @user_comments = Comment.where(charity?: false)
    @charities = Comment.where(charity?: true)
  end

  def about
  end

end