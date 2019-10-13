class Product < ApplicationRecord
  has_one :detail
  has_many :images
end