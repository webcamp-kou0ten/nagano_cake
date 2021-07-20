class Public::ItemsController < ApplicationController
before_action :authenticate_customer!, except: [:index, :show]

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_items = CartItem.new
  end

  def create
    @item = Item.find(parmas[:id])
    @cart_item = @item.customer(item_id: item_id)
    @cart_item.save
    redirect_to cart_items
  end

  def index
    @items = Item.where(sell_status: false).page(params[:page]).per(8)
    @genres = Genre.all
  end

  private
  
  def items_params
    params.require(:item).permit(:image, :name, :introduction, :price, :sell_status)
  end

end
