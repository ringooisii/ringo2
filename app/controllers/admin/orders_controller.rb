class Admin::OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :only_admin_user


  def index
  	@orders = Order.all
    @users = User.count
  end

  def show
     @order = Order.find(params[:id])
     # @order_products = Order_products.where(order_id: @order.id)
  end

  def create

  end



  private
  def only_admin_user
    if current_user.id != 1
      redirect_to products_path
    end
  end
end
