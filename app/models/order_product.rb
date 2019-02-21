class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :order_quantity, presence: true
  validates :order_price, presence: true
  validates :order_name, presence: true
end

