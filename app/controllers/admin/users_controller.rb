class Admin::UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@orders = Order.where(user_id: @user.id)
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

	def

	end

  private
  def user_params
  	params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address)
  end

end