class Admin::ItemsController < ApplicationController
  def index
      @items = Item.page(params[:page])
  end

  def new
    @items = Item.new
  end

  def create
     @items = Item.new(item_params)
     @items.item_id = current_item.id
     @items.save
     redirect_to admin_items_new_path
    # if @item.save
    #   redirect_to admin_items_new_path(@item)
    # else
    #   flash.now[:notice] = '商品の登録に失敗しました'
    # end

  end

  def show
  end

  def edit
  end

   def update
   end

   private

   def item_params
     params.require(:item).permit(:image, :name, :description, :price)
   end

 end

