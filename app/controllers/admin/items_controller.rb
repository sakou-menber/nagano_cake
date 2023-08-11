class Admin::ItemsController < ApplicationController
  def index
      @items = Item.page(params[:page])
  end

  def new
    @items = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
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
     params.require(:item).permit(:image, :name, :description, :price, :genre)
  end
   
 end
 


