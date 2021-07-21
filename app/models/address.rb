class Address < ApplicationRecord
  belongs_to :customer

  with_options presence: true do
    validates :name
    validates :address
    validates :postal_code
  end

  def address_pulldown
    customer.postal_code + + customer.address + + customer.last_name + customer.first_name
  end

end
