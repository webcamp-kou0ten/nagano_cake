class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :addresses
  has_many :orders
  accepts_nested_attributes_for :addresses, allow_destroy: true

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :address
    validates :postal_code
    validates :phone_number
  end

  validates :encrypted_password, length: {minimum: 6}

  def delivery_addresses
    @addresses.each do |address|
      ""
    end
  end

end
