class Order < ApplicationRecord
  enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }
  enum order_status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }

  has_many :order_items
  belongs_to :customer
  with_options presence: true do
    validates :name
    validates :postal_code
    validates :address
    validates :shipping_cost
    validates :price
  end

  VALID_ADDRESS_REGEX = /(...??[都道府県])(.+?郡.+?[町村]|.+?市.+?区|.+?[市区町村])(.+)/
  validates :address, format: { with: VALID_ADDRESS_REGEX}
  VALID_POSTAL_CODE_REGEX = /^[0-9]{7}/
  validates :postal_code, format: { with: VALID_POSTAL_CODE_REGEX, :multiline => true }

  # 未使用
  def price_add_tax
    self.order_items.item.price*1.1
  end

end
