class Order < ApplicationRecord
  enum payment_method: {0 => クレジットカード, 1 => 銀行振込}
  enum order_status: {0 => 入会待ち, 1 => 入金確認, 2 => 製作中, 3 => 発送準備中, 4 => 発送済み}

  has_many :order_items
  belongs_to :customer
  with_options presence: true do
    validates :name
    validates :postal_code
    validates :address
    validates :shipping_cost
    validates :price
  end
end
