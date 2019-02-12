class Admin::ProductsController < ApplicationController
	def new
		@product = Product.new
		#@disc = @product.discs.build
		#@song = @disc.songs.build
	end

	private
		def product_params
			params.require(:product).permit(:genre, :product_name, :price, :artist_name, :product_image, :company, :stock_quantity)
		end
end


#genre
#product_name
#price
#artist_name
#product_image_id
#company
#stock_quantity
#created_at
#updated_at
#deteled