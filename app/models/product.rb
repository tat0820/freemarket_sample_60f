class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_one :detail
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
end