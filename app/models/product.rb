class Product < ApplicationRecord
	attachment :product_image
	has_many :discs, inverse_of: :product
	has_many :order_products

	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
	enum genre:{jpop: 0,kpop:1,a:2,b:3,c:4}
	validates :product_name, presence: true
	validates :artist_name, presence: true
	validates :price, presence: true
	validates :company, presence: true
	validates :stock_quantity, presence: true
end
