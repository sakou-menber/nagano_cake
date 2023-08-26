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

    @postage = 800

  end

  def complete
  end

  def create
    order = Order.new(order_params)

    order.save

    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item_id
      @order_details.amount = cart_item.amount
      @order_details.purchase_price= order.total_payment
      @order_details.save

    end

    current_customer.cart_items.destroy_all
      redirect_to orders_complete_path

  end

    def index
       @order = current_customer.orders.all
    end

    def show
       @order = Order.find(params[:id])
      # @order = current_customer.orders.find(params[:id])
    end


    private

    def order_params
      params.require(:order).permit(:payment_method, :customer_id, :postage, :payment_method, :total_payment, :shipping_address, :shipping_postal_code, :shipping_name)
    end

end


