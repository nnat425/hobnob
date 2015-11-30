class CartsController < ApplicationController

  def show
    @cart = Cart.find_by(id: params[:id])
    @advisors = []
    @cart.potential_appointments.each do |appointment|
      @advisors << Advisor.find_by(id:appointment.advisor_id)
    end
  end


  def update
    potential_appointment = PotentialAppointment.find_by(id:params[:advisor][:appointment_id])
    if current_cart.potential_appointments.include?(potential_appointment)
      flash[:already_in_cart] = "This appointment is already in your cart"
      redirect_to advisor_path
    else
      current_cart.potential_appointments.push(potential_appointment)
      current_cart.update(checked_out?: false)
      flash[:added_to_cart] = "Successfully Added To Cart!"
      redirect_to advisor_path
    end
  end





end