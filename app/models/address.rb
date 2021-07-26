class Address < ApplicationRecord
  belongs_to :customer

  with_options presence: true do
    validates :name
    validates :address
    validates :postal_code
  end

  def address_pulldown
    "〒" + self.postal_code + " " + self.address + " " + self.name
  end

  VALID_ADDRESS_REGEX = /(...??[都道府県])(.+?郡.+?[町村]|.+?市.+?区|.+?[市区町村])(.+)/
  validates :address, format: { with: VALID_ADDRESS_REGEX}
  VALID_POSTAL_CODE_REGEX = /^[0-9]{7}/
  validates :postal_code, format: { with: VALID_POSTAL_CODE_REGEX, :multiline => true }

end
