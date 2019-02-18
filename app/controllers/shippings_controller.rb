class ShippingsController < ApplicationController
  def index
  	@shipping = Shipping.new
  end

  def create
  	@shipping = Shipping.new(shipping_params)
    @shipping.user_id = current_user.id
  	@shipping.save
  	redirect_to orders_path
  end

  def destroy
  end

  private
  def shipping_params
  	params.require(:shipping).permit(:shipping_address, :shipping_postcode, :shipping_name)
  end
end
