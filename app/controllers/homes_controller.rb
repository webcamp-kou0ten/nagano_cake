class HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Item.where(sell_status: false).page(params[:page]).per(10).reverse_order
  end

  def about
  end

end
