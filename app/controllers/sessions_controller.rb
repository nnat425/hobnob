class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    advisor = advisor.find_by(email: session_params[:email])
    if user.try(:authenticate, session_params[:password]) || advisor.try(:authenticate, session_params[:password])
    else
      flash[:login_fail] = "Please input the correct username/password!"
      redirect_to login_path
    end
  end

end