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


end
