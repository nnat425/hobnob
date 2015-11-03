class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      user.create(user_params)
      render :"thanks"
    else
      flash[:error] = user.error.full_messages
      redirect_to new_user_path
    end
  end








  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email, :student,  :school, :program, :graduation_date)
  end

end