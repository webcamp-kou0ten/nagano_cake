class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
  end

  def production_status
  end

  def order_status
  end

end
