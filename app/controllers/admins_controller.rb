class AdminsController < ApplicationController

  before_action :admin_only, only:[:index]

  def index #Shows Network Members
    @advisors = Advisor.all
  end

  def new
  end

  def create #Create Admin session
    admin = Admin.find_by(username: admin_session_params[:username])
    if admin.try(:authenticate, admin_session_params[:password])
     session[:admin_id] = admin.id
     session[:class_type] = admin.class.name
     redirect_to root_path
   else
    flash[:error] = "Please input the correct username/password!"
    redirect_to admin_login_path
  end
end

def destroy
 session[:admin_id] = nil
 session[:class_type] = nil
 redirect_to admin_login_path
end

private

def admin_session_params
  params.require(:session).permit(:username, :password)
end

def admin_only
  redirect_to(root_path) unless admin_logged_in?
end


end