class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :current_advisor, :current_cart, :cities, :admin_logged_in?

  def current_user
    if logged_in? && session[:class_type] == "User"
      return User.find_by(id: session[:user_or_advisor_id])
    end
  end

  def current_advisor
    if logged_in? && session[:class_type] == "Advisor"
      return Advisor.find_by(id: session[:user_or_advisor_id])
    end
  end

  def logged_in?
    session[:user_or_advisor_id]
  end

  def admin_logged_in?
    session[:admin_id]
  end

  def current_cart
    current_user.carts.last
  end

  def cities
    ["Toronto", "Calgary", "Vancouver","Montreal","NYC","Houston","San Francisco","Boston", "Chicago","London", "Singapore", " Hong Kong","Dubai", "Shanghai"]
  end

def total_for_student
  total = []
  cart.potential_appointments.each {|appointment|total.push(appointment.advisor.student_price)}
  return total.reduce(:+)
end

def total_for_regular
  total = []
  cart.potential_appointments.each {|appointment|total.push(appointment.advisor.regular_price)}
  return total.reduce(:+)
end


end

