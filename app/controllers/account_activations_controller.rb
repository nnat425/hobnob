class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    advisor = Advisor.find_by(email: params[:email])
    if advisor
      if advisor && !advisor.email_verified? && advisor.authenticated?(:activation, params[:id])
        advisor.update_attribute(:email_verified,    true)
        advisor.update_attribute(:activated_at, Time.zone.now)
        flash[:success] = "Account activated!"
        redirect_to edit_advisor_path(advisor)
      else
        flash[:danger] = "Invalid activation link"
        redirect_to root_url
      end
    else
     if user && !user.email_verified? && user.authenticated?(:activation, params[:id])
      user.update_attribute(:email_verified,    true)
      user.update_attribute(:activated_at, Time.zone.now)
      flash[:success] = "Account activated!"
      redirect_to edit_user_path(user)
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

end
