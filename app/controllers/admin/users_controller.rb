class Admin::UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@orders = Order.all
	end

	def edit
	end

	def update
	end

	def destroy
	end
end