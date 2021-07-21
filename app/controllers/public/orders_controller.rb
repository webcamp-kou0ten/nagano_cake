class Public::OrdersController < ApplicationController

  def new
    @order = Order.new(customer_id: current_customer.id)
    @registered_address = @order.customer.address
    @address = Address.new
    # @order.addresses.build
  end

  def index
  end

  def show
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    # order_item.amount = cart_item.amount
    # order_item.item_id = cart_item.item_id
    order.save
    redirect_to public_orders_confirm_path
  end

  def thanks
  end

  def confirm
    if params[:order][:address_select] == "my_address"
    elsif params[:order][:address_select] == "new_address"
      @order = Order.new(order_params)
      @address = Address.new
      @address.name = @order.name
      
      
      @address.save
    end
  end

  private

    def address_params
      params.require(:address).permit(:postal_code, :address, :name)
    end

    def order_params
      params.require(:order).permit(:name,:postal_code, :payment_method, addresses_attributes:[:postal_code, :address, :name])
    end

end