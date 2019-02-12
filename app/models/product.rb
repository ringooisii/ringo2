class Product < ApplicationRecord
	attachment :product_image
	#has_many :disc, inverse_of: :product
	#accepts_nested_attrbutes_for :disc, reject_if: :all_blank, allow_destroy: true
end

