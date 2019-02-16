class CartsController < ApplicationController
  def index
  end

  def create
  	@cart = Cart.new(cart_params)
  	@cart.save
  	redirect_to carts_path
  end

  def update
  end

  def destroy
  end

  private
  def cart_params
    params.require(:cart).permit(:quantity)
  end

end
