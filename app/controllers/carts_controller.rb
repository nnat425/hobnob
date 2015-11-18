class CartsController < ApplicationController

def show
@cart = Cart.find_by(id: params[:id])
@advisors = []
@cart.potential_appointments.each do |appointment|
  @advisors << Advisor.find_by(id:appointment.advisor_id)
end
end


def update
current_cart.potential_appointments.push(PotentialAppointment.find_by(id:params[:advisor][:appointment_id]))
current_cart.update(checked_out?: false)
redirect_to root_path
end





end