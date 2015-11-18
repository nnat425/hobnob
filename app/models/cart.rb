class Cart < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :potential_appointments


  after_update :create_timer


  def create_timer
  # if User.find_by(id: session[:user_or_advisor_id]).carts.last.checked_out? == false
    User.find_by(id: session[:user_or_advisor_id]).carts.last.potential_appointments.each do|item_in_cart|
      User.find_by(id: session[:user_or_advisor_id]).carts.last.potential_appointments.delete(item_in_cart)
    # end
  end
end
  # handle_asynchronously :in_the_future, :run_at => Proc.new { 10.seconds.from_now }



end


#Need to clear items from shopping cart
#1. How do I start the timer?
#2. User adds an item to the cart
#3. Starts a timer for the shopping cart
#4. Once the timer hits 30 minutes from previous time, all items are removed the cart
#5.

