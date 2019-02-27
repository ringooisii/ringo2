class CartsController < ApplicationController
  before_action :authenticate_login_user


  def index
    @carts = current_user.carts
  end

  def create
     if @cart = Cart.find_by(user_id: current_user.id, product_id: params[:cart][:product_id] ) #全く同じものを探してくれる
        @cart.quantity += params[:cart][:quantity].to_i
        @cart.save
     redirect_to carts_path
    else
     @cart = Cart.new(cart_params)
     @cart.user_id = current_user.id
  	 @cart.save
  	 redirect_to carts_path
  end
end

  def update
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
    redirect_to carts_path
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path
  end

  private
  def cart_params
    params.require(:cart).permit(:quantity, :product_id)
  end

  def authenticate_login_user
    unless :authenticate_user!
    redirect_to products_path
    flash[:notice] = "ログインして下さい"
    end
  end

end
