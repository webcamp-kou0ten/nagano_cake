class OrderItem < ApplicationRecord
  enum production_status: { "着手不可":0, "製作待ち":1, "製作中":2, "製作完了":3 }
  belongs_to :order
  belongs_to :item

  def total_of_price
    item.price * amount * 1.1
  end

end
