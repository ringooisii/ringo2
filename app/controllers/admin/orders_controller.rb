class Admin::OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
  	@orders = Order.all
    @users = User.count
  end

  def show
     @order = Order.find(params[:id])
     @order_products = Order_products.where(order_id: @order.id)
  end
end
