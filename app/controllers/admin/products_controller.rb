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
	 if product.save
		redirect_to root_path
	 else
	 	flash[:notice] = "error"
	 	@product = Product.new
	 	render action: :new
	 end
	end

	def show
		@products = Product.find(params[:id])
		#@product = Product.all.includes(:discs)
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to admin_products_path
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
			@product = Product.find(params[:id])
		if @product.update(product_params)
			flash[:notice] = "successfully"
			redirect_to admin_products_path(@product)
		else
			flash[:notice] = "error"
			render action: :edit
		end
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