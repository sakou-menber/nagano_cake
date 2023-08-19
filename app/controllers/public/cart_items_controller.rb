class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.find(params[:item_id])
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_items = CartItem.find(params[:id])
    redirect_to cart_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end

