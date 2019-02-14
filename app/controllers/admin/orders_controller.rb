class Admin::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
    @order = Order.find(parame[:id])
  end
end
