class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_one :detail
  has_many :images, inverse_of: :product
  accepts_nested_attributes_for :images
end