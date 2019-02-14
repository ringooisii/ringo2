class Product < ApplicationRecord
	attachment :product_image
	has_many :discs, inverse_of: :product
	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
	enum genre:{jpop: 0,kpop:1,a:2,b:3,c:4}
	validates :product_name, presence: true
end

