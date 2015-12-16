class PasswordResetsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    advisor = Advisor.find_by(email: params[:email])
    if user
      user.send_password_reset
      flash[:pw_reset] = "Email sent with password reset instructions."
      redirect_to root_url
    elsif advisor
      advisor.send_password_reset
      flash[:pw_reset] = "Email sent with password reset instructions."
      redirect_to root_url
    else
      flash[:not_valid] = "Email does not exist"
      redirect_to new_password_reset_path
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end


  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(password:params[:user][:password],password_confirmation:params[:user][:password_confirmation],email_confirmation: @user.email)
      flash[:pw_reset_confirm] = "Password has been reset!"
      redirect_to root_url
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  private

  # def password_params
  #   params.require(:user).permit(:password,:password_confirmation)
  # end

end
