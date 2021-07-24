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

  # VALID_PRICE_CODE_REGEX = /^[0-9]{6}/
  # validates :price, format: { with: VALID_PRICE_CODE_REGEX, :multiline => true }

end
