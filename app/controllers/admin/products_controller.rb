class Admin::ProductsController < ApplicationController
before_action :authenticate_user!
before_action :only_admin_user
PER = 5
	def new
		@product = Product.new
		#@disc = @product.discs.build
		#@song = @disc.songs.build
	end

	def index
		#@product = Product.all
		@product = Product.page(params[:page]).per(PER)
	end

	def create
		product = Product.new(product_params)
	 if product.save
		redirect_to root_path
	 else
	 	flash[:create] = "入力漏れがあります"
	 	@product = Product.new
	 	render action: :new
	 end
	end

	def show
		@products = Product.with_deleted.find(params[:id])
		#@product = Product.all.includes(:discs)
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to admin_products_path
	end

	def edit
		if Product.find_by(id: params[:id])
			@product = Product.find_by(id: params[:id])
		else
			flash[:delete] = "この商品は削除されています"
			redirect_to admin_product_path(params[:id])
		end
	end

	def update
			@product = Product.find(params[:id])
		if @product.update(product_params)
			#flash[:notice] = "successfully"
			redirect_to admin_products_path(@product)
		else
			flash[:edit] = "error"
			render action: :edit
		end
	end

	private
		def product_params
			params.require(:product).permit(:genre, :product_name, :price, :artist_name, :product_image, :company, :stock_quantity,
				discs_attributes: [:id, :disc_name, :disc_number, :_destroy,
				songs_attributes: [:id, :title, :song_number, :_destroy]])
		end

		def only_admin_user
			if current_user.id != 1
				redirect_to products_path
			end
		end
end
