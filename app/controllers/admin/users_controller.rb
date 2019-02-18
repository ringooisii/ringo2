class Admin::UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :only_admin_user

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@orders = Order.where(user_id: @user.id)
    @orders.each do |order|
      order_product = OrderProduct.where(order_id: order.id)
      order_product.each do |p|
        @p = Product.find(p.product_id)
      end
    end
	end

  def edit
    @user = User.find(params[:id])
  end

	def update
		user = User.find(params[:id])
		user.update(user_params)
		if user.save
			redirect_to admin_user_path(user.id)
		else
			render :edit
		end
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		redirect_to admin_users_path
	end


  private
  def only_admin_user
  	if current_user.id != 1
  		redirect_to products_path
  	end
  end

  def user_params
  	params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address)
  end

end