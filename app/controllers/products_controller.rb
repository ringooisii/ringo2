class ProductsController < ApplicationController
  def index
    @search = Product.page(params[:page]).ransack(params[:q])
    @products = @search.result
  end

  def show
    @product = Product.find(params[:id])
    @cart = Cart.new
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
