class Address < ApplicationRecord
  belongs_to :user

  validates :post_code, presence: true
  validates :prefecture, presence: true
  validates :town, presence: true
  validates :street, presence: true
end
