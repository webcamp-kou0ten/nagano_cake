class Public::OrdersController < ApplicationController

  def new
    @order = Order.new(customer_id: current_customer.id)
  end

  def index
    @orders = current_customer.orders.page(params[:page]).per(10).reverse_order
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    cart_items = current_customer.cart_items.all
      cart_items.each do |cart_item|
        order_items = order.order_items.new
        order_items.item_id = cart_item.item.id
        order_items.total_price = cart_item.item.price
        order_items.amount = cart_item.amount
        order_items.save
      end
    current_customer.cart_items.destroy_all
    redirect_to public_orders_thanks_path
  end

  def thanks
  end

  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = @cart_items.inject(0) do |sum, item|
      sum + item.sum_of_price
    end
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @order.postal_code = @order.customer.addresses.find(params[:order][:address_id].to_i).postal_code
      @order.address = current_customer.addresses.find(params[:order][:address_id].to_i).address
      @order.name = current_customer.addresses.find(params[:order][:address_id].to_i).name
    else
      @address = Address.new
      @address.name = @order.name
      @address.postal_code = @order.postal_code
      @address.address = @order.address
      @address.customer_id = current_customer.id
      @address.save
    end
  end

  # 非推奨：ビューからコントローラーのメソッドを呼び出す書き方
  # def total_of_price(item)
  #   (item.price * 1.1 ).round
  # end

  private

    def address_params
      params.require(:address).permit(:postal_code, :address, :name)
    end

    def order_params
      params.require(:order).permit(:name, :postal_code, :payment_method, :address, :id, :shipping_cost, :price)
    end

  # 59行目とセット
  # helper_method :total_of_price

end
