class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    
  end

  def confirm
    @order = Order.new(order_params)
  end

  def complete
  end

  def create
    
  end

  def index
  end

  def show
  end

end

