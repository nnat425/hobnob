class WelcomeController < ApplicationController
  def index
    @comments = Comment.all
  end

  def about
  end

end