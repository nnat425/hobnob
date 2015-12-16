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
    if User.find_by_password_reset_token!(params[:id])
      @user_or_advisor = User.find_by_password_reset_token!(params[:id])
    else
      @user_or_advisor = Advisor.find_by_password_reset_token!(params[:id])
    end
  end


  def update
    if User.find_by_password_reset_token!(params[:id])
      @user_or_advisor = User.find_by_password_reset_token!(params[:id])
    else
      @user_or_advisor = Advisor.find_by_password_reset_token!(params[:id])
    end
    if @user_or_advisor.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @user_or_advisor.class.name == "User"
      @user_or_advisor.update_attributes(password:params[:user][:password],password_confirmation:params[:user][:password_confirmation],email_confirmation: @user_or_advisor.email)
      flash[:pw_reset_confirm] = "Password has been reset!"
      redirect_to root_url
    elsif @user_or_advisor.class.name == "Advisor"
      @user_or_advisor.update_attributes(password:params[:advisor][:password],password_confirmation:params[:advisor][:password_confirmation],email_confirmation: @user_or_advisor.email)
      flash[:pw_reset_confirm] = "Password has been reset!"
      redirect_to root_url
    else
      flash[:errors] = @user_or_advisor.errors.full_messages
      render :edit
    end
  end

  private

  # def password_params
  #   params.require(:user).permit(:password,:password_confirmation)
  # end

end
