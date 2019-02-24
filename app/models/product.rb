class Product < ApplicationRecord
	attachment :product_image
	has_many :discs, inverse_of: :product
	has_many :order_products
	has_many :orders, through: :order_products
	has_many :users, through: :carts
  	has_many :carts

	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
	enum genre:{JPOP: 0,KPOP:1,洋楽:2,ジャズ:3,ロック:4,クラシック:5,アニメ:6,ヒップホップ:7,ソウル:8}
	validates :product_name, presence: true
	validates :artist_name, presence: true
	validates :price, presence: true
	validates :company, presence: true
	validates :stock_quantity, presence: true
	acts_as_paranoid
end
