class Order < ApplicationRecord

  has_many :order_products,dependent: :destroy

  belongs_to :user

  enum order_status: {a: 0, b: 1}

end
