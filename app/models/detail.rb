class Detail < ApplicationRecord
  belongs_to :product
  validates :large_category, presence: true
end
