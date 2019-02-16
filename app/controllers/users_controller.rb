class UsersController < ApplicationController
  def show
  	@user = current_user
    @order_products = 
    @order_product = current_user
  end

  def edit
  	@user = current_user
  end

  def update
    @user =current_user
  if @user.update(user_params)
    flash[:notice] = "User was successfully updated."
    redirect_to user_path
    
  else
    render :edit
  end
  end

  def destroy
  end
end
 private
    def user_params
      params.require(:user).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postcode,:address,:email)
    end

