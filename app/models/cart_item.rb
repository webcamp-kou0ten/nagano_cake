class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :amount, numericality: { in: 1..20 }

  def sum_of_price(tax_rate = 1.1)
    item.price * amount * tax_rate
  end

end
