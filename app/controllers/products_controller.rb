class ProductsController < ApplicationController
    def index
      @search = Product.page(params[:page]).ransack(params[:q])
      @products = @search.result.order(created_at: "desc")
    end

    def show
      @product = Product.find(params[:id])
      @cart = Cart.new
    end

    def new
      @products = product.new
      @user = current_user
    end

    def create
     @products = product.new
     @product.user_id = current_user
     if @product.save
      flash[:notice] = "product was successfully created."
      redirect_to admin_products_path(@product.id)
    else
      @products = Product.all
      @user = current_user
      render "index"
    end
    end

    def edit
    end

    def update
    end

    def destroy
    end
    private
  def correct_user
      product = Product.find(params[:id])

    end
  def product_params
    params.require(:product).permit(:title, :opinion, :image)
  end

end
