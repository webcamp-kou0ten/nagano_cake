class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  private
    def current_cart
      # セッションから取得したcart_idを元にCartテーブルからCart情報を取得
      current_cart = CartItem.find_by(id: session[:cart_item_id])
      # Cart情報が存在しない場合、@current_cartを作成
      current_cart = CartItem.create unless current_cart
      # 取得したCart情報よりIDを取得し、セッションに設定
      session[:cart_item_id] = current_cart_id
      # Cart情報を返却
      current_cart
    end
  
end
