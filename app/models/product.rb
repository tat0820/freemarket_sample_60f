class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
  has_one :detail
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  validates :name, presence: true,length: { minimum: 1, maximum: 40 }
  validates :discription, presence: true,length: { minimum: 1, maximum: 1000 }
  validates :condition, presence: true
  validates :delivery_charge, presence: true
  validates :origin_area, presence: true
  validates :days_left_send, presence: true
  validates :price, 
            presence: true,
            numericality: { only_integer: true,  greater_than: 299, less_than: 10000000}
end