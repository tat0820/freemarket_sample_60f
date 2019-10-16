class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one :address
  accepts_nested_attributes_for :address

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 7 }
  validates :password_confirmation, presence: true, length: { minimum: 7 }
  validates :birthday_year, presence: true
  validates :birthday_month, presence: true
  validates :birthday_day, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :card_number, presence: true
  validates :card_limit_year, presence: true
  validates :card_limit_month, presence: true
  validates :security_code, presence: true
end
