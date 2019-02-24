class OrdersController < ApplicationController
   PER = 3
  def index
    @order = Order.new
    @carts = current_user.carts
  end

  def create
    if current_user.shippings.present?

    	shipping = Shipping.find(params[:order][:user_id])#配送先の指定、本来は実体のないカラムを作るべき
    	@order = Order.new(user_id: shipping.user_id, order_name: shipping.shipping_name, order_address: shipping.shipping_address)#注文テーブルの作成
    	@order.save#注文テーブル保存
    	@carts = Cart.where(user_id: current_user.id)
    	@carts.each do |cart|
  	  	@order_product = OrderProduct.new(order_id:@order.id,order_quantity:cart.quantity,order_price:cart.product.price,
  	  		                                order_product_image_id:cart.product.product_image_id,order_name:cart.product.product_name,product_id:cart.product_id)
  	  	cart.product.stock_quantity -= @order_product.order_quantity#在庫数から注文数をひく
  	  	 @order_product.save#注文履歴保存

  	  	 cart.product.save
  	  	 cart.destroy#カートの削除
      end
      redirect_to user_path(current_user)
    else
      redirect_to shippings_path
    end
  end



end
