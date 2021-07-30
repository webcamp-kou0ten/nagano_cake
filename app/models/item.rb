class Item < ApplicationRecord
  has_many :order_items
  has_many :cart_items
  belongs_to :genre
  attachment :image, destroy: false

  with_options presence: true do
    validates :name
    validates :price
    validates :introduction
  end

# 税率計算
  def add_tax(tax_rate = 1.1) #引数未入力だと1.1が適用される
    (price * tax_rate ).round
  end

end
