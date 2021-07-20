class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @cart_item = @cart_items.find_by(item_id: params[:item_id])
    @total = @cart_items.inject(0) do |sum, item|
      sum + item.sum_of_price
    end
  end

  def create
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.save
      flash[:notice] = "カートへの追加に成功しました！！"
      redirect_to public_cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      flash[:notice] = "カートへの追加に成功しました！！"
      redirect_to public_cart_items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to request.referer
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:notice] = "削除しました"
    redirect_to request.referer
  end
  
  def all_destroy
    cart_items = CartItem.all
    cart_items.destroy_all
    flash[:notice] = "カート内を空にしました"
    redirect_to public_items_path
  end
  
  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :amount, :item_id)
  end

end
