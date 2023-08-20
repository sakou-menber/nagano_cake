class Public::OrdersController < ApplicationController
  def new
    @shipping_address = ShippingAddress.all
    @payment_method = PaymentMethod.all
  end

  def confirm
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

