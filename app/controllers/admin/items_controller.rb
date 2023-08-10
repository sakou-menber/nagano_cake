class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_new_path
    else
      flash.now[:notice] = '商品の登録に失敗しました'
    end

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

