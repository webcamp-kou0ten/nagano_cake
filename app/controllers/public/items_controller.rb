class Public::ItemsController < ApplicationController
before_action :authenticate_customer!, except: [:index]

  def show
    @item=Item.find(params[:id])
    @cart_items=CartItem.new
  end

  def create
    @item=Item.find(parmas[:id])
    @cart_item=@item.customer(item_id: item_id)
    @cart_item.save
    redirect_to cart_items
  end

  def index
    @items = Item.where(sell_status: false).page(params[:page]).per(8)
    @range1 = 1..10
    @range2 = 1..10
  end

  private
  def items_params
    params.require(:item).permit(:image, :name, :introduction, :price, :sell_status)
  end

end
