class AdminsController < ApplicationController


  def new
  end

  def create #Create Admin session
    binding.pry
    admin = Admin.find_by(username: session[:username])
    if admin.try(:authenticate, admin_session_params[:password])
     session[:admin_id] = admin.id
     session[:class_type] = admin.class.name
     redirect_to root_path
   else
    flash[:login_fail] = "Please input the correct username/password!"
    redirect_to admin_login_path
  end
end

private

def admin_session_params
  params.require(:session).permit(:username, :password)
end


end