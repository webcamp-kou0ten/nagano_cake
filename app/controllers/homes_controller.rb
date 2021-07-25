class HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Item.where(sell_status: false).page(params[:page]).per(4).reverse_order
  end

  def about
  end

end
