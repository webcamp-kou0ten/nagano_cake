class Order < ApplicationRecord
  enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }
  enum order_status: { "入金待ち": 0, "入金確認": 1, "製作中":2, "発送準備中":3, "発送済み":4 }

  has_many :order_items
  belongs_to :customer
  with_options presence: true do
    validates :name
    validates :postal_code
    validates :address
    validates :shipping_cost
    validates :price
  end

  # 未使用
  def price_add_tax
    self.order_items.item.price*1.1
  end

end
