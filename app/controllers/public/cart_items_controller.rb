class Public::CartItemsController < ApplicationController
  before_action :setup_cart_item, only: [:create, :update, :destoy]
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    # @cart_items = current_customer.cart_items.includes([:item_id])
    # @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def create
    
    # @cart_item=CartItem.new(setup_cart_item)
    # @cart_item.customer_id=current_customer.id
      @cart_item = current_customer.cart_items.build(setup_cart_item)
      # @cart_item.amount += params[:cart_item][:amount].to_i
      if @cart_item.save
        flash[:notice]="カートへの追加に成功しました！！"
        redirect_to public_cart_items_path
      else
        redirect_to request.referer
      end
  end

  def update
    @cart_item.update(amount: params[:amount].to_i)
    redirect_to current_customer_cart_item
  end

  def destroy
    @cart_item.destroy
    redirect_to current_customer_cart_item
  end

  private
  def setup_cart_item
    # params.permit(:customer_id, :amount)
    # @cart_item = current_cus3tomer.cart_items.find_by(item_id: params[:item_id])
    params.require(:cart_item).permit(:customer_id, :amount, :item_id)
  end
end

# def show
#     @line_items = CartItem.line_items
#   end

#   def create
#     @line_item = CartItem.cart_items.build(item_id: params[:item_id]) if @line_item.blank?
#     @line_item.amount += params[:amount].to_i
#     if @line_item.save
#       redirect_to current_cart
#     else
#       redirect_to controller: "products", action: "show"
#     end
#   end

#   def destroy
#     @cart.destroy
#     redirect_to current_cart
#   end

#   private
#   def set_user
#     @user = current_user
#   end

#   def setup_cart_item
#     @lineItem = current_customer.cart_items.find_by(item_id: params[:item_id])
#   end

#   def set_cart
#     @cart = current_cart
#   end
# end
