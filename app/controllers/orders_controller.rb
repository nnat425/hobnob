class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @order = current_cart.build_order(order_params)
    @order.ip_address = request.remote_ip
    if @order.save
      if @order.purchase && current_cart.check_booked_status
        current_cart.update(checked_out?: true)
        current_cart.update_booked_status
        current_cart.potential_appointments.each do |appointment|
        UserMailer.confirmation_email(current_user,appointment).deliver_now
        AdvisorMailer.confirmation_email(current_user,appointment).deliver_now
        AdminMailer.confirmation_email(current_user,appointment).deliver_now
      end
        current_user.carts.create
        render template: "success"
      else
        render template: "failure"
      end
    else
      render :action => 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name,:last_name,:card_type,:card_number,:card_verification,:card_expires_on)
  end

end