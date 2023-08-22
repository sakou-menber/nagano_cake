class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_postal_code = current_customer.postal_code
    @order.shipping_address = current_customer.address
    @order.shipping_name = current_customer.last_name + current_customer.first_name
    @customer = current_customer
    @cart_items = @customer.cart_items
    @total = 0


  end

  def complete
  end

  def create

  end

  def index
  end

  def show
  end

    private

    def order_params
      params.require(:order).permit(:payment_method)
    end

end

