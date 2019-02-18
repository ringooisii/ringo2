class OrderProductsController < ApplicationController
	def create
    @order = Order.new(order_params)
    @order.save
	end

	def update
	end

	def destroy
	end


private
  def order_params
    params.require(:order_product).permit(:order_id, :product_id, :order_quantity, :order_price, :order_product_image_id, :order_name)
  end
end
