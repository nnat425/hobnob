class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    if logged_in?
      return User.find_by(id: session[:user_or_advisor_id])
    end
  end

  def current_advisor
    if logged_in?
      return Advisor.find_by(id: session[:user_or_advisor_id])
    end
  end

  def logged_in?
    session[:user_or_advisor_id]
  end

  def current_cart
    current_user.carts.last
  end



end

