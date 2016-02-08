class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    advisor = Advisor.find_by(email: session_params[:email])
    if user
      if user.try(:authenticate, session_params[:password])
       if user.carts.last.checked_out? == true
        user.carts.create
      end
      session[:user_or_advisor_id] = user.id
      session[:class_type] = user.class.name
      if request.xhr?
        render partial: "layouts/header"
      else
        redirect_to advisors_path
      end
    else
      flash[:login_fail] = "Please input the correct email/password!"
      redirect_to login_path
    end
  elsif advisor.try(:authenticate, session_params[:password])
    session[:user_or_advisor_id] = advisor.id
    session[:class_type] = advisor.class.name
    if request.xhr?
      render partial: "layouts/header"
    else
      redirect_to advisors_path
    end
  else
    flash[:login_fail] = "Please input the correct email/password!"
    redirect_to login_path
  end
end

def destroy
  session[:user_or_advisor_id] = nil
  redirect_to login_path
end


def session_params
  params.require(:session).permit(:email, :password)
end

end