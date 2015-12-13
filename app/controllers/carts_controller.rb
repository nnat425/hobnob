class CartsController < ApplicationController

  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def update #Adds an item to the current cart
    if current_user
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
    else
      redirect_to new_user_path
    end
  end

#Deleting an item from cart
def destroy
  current_cart.potential_appointments.delete(PotentialAppointment.find_by(id: params[:potential_appointment]))
  flash[:item_remove] = 'The appointment has been removed the cart'
  redirect_to cart_path(params[:id])
end





end