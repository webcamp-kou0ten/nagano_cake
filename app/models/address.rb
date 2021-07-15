class Address < ApplicationRecord
  belongs_to customer

  with_options presence: true do
    validates :name
    validates :address
    validates :postal_code
end
