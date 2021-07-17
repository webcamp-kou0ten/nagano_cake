class Public::ItemsController < ApplicationController

  def show
    @item=Item.find(params[:id])
  end

  def index
    @items = Item.where(sell_status: false).page(params[:page]).per(8)
  end

  private
  def items_params
    params.require(:item).permit(:image, :name, :introduction, :price, :sell_status)
  end

end
