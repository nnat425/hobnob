class CartsController < ApplicationController

def show
@cart = Cart.find_by(id: params[:id])
@advisors = []
@cart.potential_appointments.each do |advisor_id|
  @advisors << Advisor.find_by(id: advisor_id)
end
end




end