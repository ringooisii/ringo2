class Order < ApplicationRecord

  has_many :order_products, dependent: :destroy

  belongs_to :user

  # enum order_status: { undispatched: 0, Shipped: 1 }
  enum order_status: { 未発送: 0, 発送済み: 1 }

end
