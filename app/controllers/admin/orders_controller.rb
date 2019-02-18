class Admin::OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :only_admin_user


  def index
  	@orders = Order.all
    @users = User.count
    @orders.each do |order|
      @order_products = OrderProduct.where(order_id: order.id)
      @order_products.each do |p|
        @p = Product.find(p.product_id)
      end
    end
  end

  def show
     @order = Order.find(params[:id])
     @order_products = OrderProduct.where(order_id: @order.id)
     @order_products.each do |product|
      @p = Product.find(product.product_id)
    end
  end

  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      redirect_to admin_order_path(order.id)
    end
  end



  private
  def only_admin_user
    if current_user.id != 1
      redirect_to products_path
    end
  end

  def order_params
    params.require(:order).permit(:order_status)
  end
end
