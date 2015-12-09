class AdminsController < ApplicationController

  def create #Create Admin session
    admin = Admin.find_by(username: session[:username])
    if admin.try(:authenticate, session_params[:password])
     session[:user_or_advisor_id] = admin.id
     session[:class_type] = admin.class.name
     redirect_to root_path
   else
    flash[:login_fail] = "Please input the correct username/password!"
    redirect_to
  end
end


end