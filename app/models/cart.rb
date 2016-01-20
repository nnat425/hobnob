class Cart < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :potential_appointments
  has_one :order


  after_update :create_timer

  def create_timer
    if self.checked_out? == false
     self.potential_appointments.each do|item_in_cart|
       self.potential_appointments.delete(item_in_cart)
     end
   end
 end
 handle_asynchronously :create_timer, :run_at => Proc.new { 10.seconds.from_now }

 def total_price_student
   total = []
   cart.potential_appointments.each do |appointment|
    if appointment.advisor.category.name == "Resume & Interview Preparation"
      total.push(50)
    else
      total.push(appointment.advisor.student_price)
    end
  end
  return total.reduce(:+)
end



def total_price_regular
 total = []
 self.potential_appointments.each do |appointment|
  if appointment.advisor.category.name == "Resume & Interview Preparation"
    total.push(60)
  else
    total.push(appointment.advisor.regular_price)
  end
end
return total.reduce(:+)
end

def update_booked_status
  self.potential_appointments.each do|potential_appointment|
    potential_appointment.update(booked_status?: true)
    potential_appointment.carts.where(checked_out?: false).each {|cart| cart.potential_appointments.delete(potential_appointment)}
  end
end


def check_booked_status
  boolean_array = []
  self.potential_appointments.each do |potential_appointment|
    boolean_array.push(potential_appointment.booked_status?)
  end
  if boolean_array.include?(false)
    return true
  else
    return false
  end
end

end

#rake jobs:work ... to test timer in development

#Need to clear items from shopping cart
#1. How do I start the timer?
#2. User adds an item to the cart
#3. Starts a timer for the shopping cart
#4. Once the timer hits 30 minutes from previous time, all items are removed the cart
#5.

