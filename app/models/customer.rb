class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :addresses
  has_many :orders

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

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  VALID_PHONE_NUMBER_REGEX = /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/
  validates :phone_number, length: { minimum: 10 }, format: { with: VALID_PHONE_NUMBER_REGEX }
  VALID_NAME_REGEX = /^[ぁ-んァ-ヶー一-龠]+$/
  validates :last_name, length: { maximum: 5 }, format: { with: VALID_NAME_REGEX, :multiline => true }
  validates :first_name, length: { maximum: 17 }, format: { with: VALID_NAME_REGEX, :multiline => true }
  VALID_NAME_KANA_REGEX = /[ァ-ヴ]/
  validates :last_name_kana, format: { with: VALID_NAME_KANA_REGEX, :multiline => true }
  validates :first_name_kana, format: { with: VALID_NAME_KANA_REGEX, :multiline => true }
  VALID_ADDRESS_REGEX = /(...??[都道府県])(.+?郡.+?[町村]|.+?市.+?区|.+?[市区町村])(.+)/
  validates :address, format: { with: VALID_ADDRESS_REGEX}
  VALID_POSTAL_CODE_REGEX = /^[0-9]{7}/
  validates :postal_code, format: { with: VALID_POSTAL_CODE_REGEX, :multiline => true }


end
