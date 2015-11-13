class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    advisor = Advisor.find_by(email: session_params[:email])
    if user
      if user.try(:authenticate, session_params[:password])
        session[:user_or_advisor_id] = user.id
        redirect_to root_path
      else
        flash[:login_fail] = "Please input the correct username/password!"
        redirect_to login_path
      end
    elsif advisor.try(:authenticate, session_params[:password])
      session[:user_or_advisor_id] = advisor.id
      redirect_to root_path
    else
      flash[:login_fail] = "Please input the correct username/password!"
      redirect_to login_path
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to login_path
  end


  def session_params
    params.require(:session).permit(:email, :password)
  end

end