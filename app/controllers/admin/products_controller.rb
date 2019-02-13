class Admin::ProductsController < ApplicationController
	def new
		@product = Product.new
		#@disc = @product.discs.build
		#@song = @disc.songs.build
	end

	def index
		@product = Product.all
	end

	def create
		product = Product.new(product_params)
		product.save
		redirect_to root_path
	end

	def show
	end

	private
		def product_params
			params.require(:product).permit(:genre, :product_name, :price, :artist_name, :product_image, :company, :stock_quantity,
				discs_attributes: [:id, :disc_name, :disc_number, :_destroy,
				songs_attributes: [:id, :title, :song_number, :_destroy]])
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