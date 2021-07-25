class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order_item = @order_items.pluck(:item_id)
    @items = Item.find(@order_item)
    @total = @order_items.inject(0) do |sum, item|
      sum + item.total_of_price
    end
  end

  def production_status
    order = Order.find(params[:id])
    order_items = order.order_items
    order_item = order_items.find(params[:order_item][:id])
    order_item.update(production_status: params[:order_item][:production_status].to_i)
    if order_item.production_status == "製作中"
      order.update( order_status: 2 )
    elsif
      count = 0
      order_items.each do |order_item|
        if order_item.production_status == "製作完了"
          count += 1
        end
      end
      if count == order_items.count
        order.update( order_status: 3 )
      end
    end
    redirect_to request.referer
  end

  def order_status
    order = Order.find(params[:id])
    order.update(order_status: params[:order][:order_status].to_i)
      if order.order_status == "入金待ち"
        order.order_items.update_all("'production_status' = 0")
      elsif order.order_status == "入金確認"
        order.order_items.update_all("'production_status' = 1")
      end
    redirect_to request.referer
  end

end
