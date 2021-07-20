class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  validates :amount, numericality: { in: 1..10 }
  
  def sum_of_price
    item.price * amount
  end
  
end
