class Product < ApplicationRecord
	attachment :product_image
	has_many :discs, inverse_of: :product
	has_many :order_products
	has_many :users, through: :carts
  	has_many :carts

	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
	enum genre:{洋楽: 0,邦楽:1,ロック:2,ジャズ:3,KPOP:4,クラシック:5,アニメ:6}
	validates :product_name, presence: true
	validates :artist_name, presence: true
	validates :price, presence: true
	validates :company, presence: true
	validates :stock_quantity, presence: true
	acts_as_paranoid
end
