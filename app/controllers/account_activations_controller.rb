class AccountActivationsController < ApplicationController

def edit
    advisor = Advisor.find_by(email: params[:email])
    if advisor && !advisor.email_verified? && advisor.authenticated?(:activation, params[:id])
      advisor.update_attribute(:email_verified,    true)
      advisor.update_attribute(:activated_at, Time.zone.now)
      flash[:success] = "Account activated!"
      redirect_to edit_advisor_path(advisor)
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

end
