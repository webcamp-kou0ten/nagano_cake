class OrderItem < ApplicationRecord
  enum production_status: {0 =>着手不可, 1 =>製作待ち, 2 =>製作中, 3 =>製作完了}
  belongs_to :order
  belongs_to :item
end
