class Public::ItemsController < ApplicationController

  def show
    @item=Item.find(params[:id])
  end

  def index
    @items=Item.all
    @item = Item.page(params[:page]).per(10)
  end

end
