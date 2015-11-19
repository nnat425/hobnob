class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @order = current_cart.build_order(order_params)
    @order.ip_address = request.remote_ip
    if @order.save
      if @order.purchase
        render :action => "success"
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