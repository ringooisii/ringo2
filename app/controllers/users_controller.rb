class UsersController < ApplicationController
  def show
  	@user = current_user
  end

  def edit
  	@user = current_user
  end

  def update
     @user =current_user
  if @user.update(user_params)
    flash[:notice] = "User was successfully updated."
    redirect_to root_path
    
  else
    render :edit
  end
  end

  def destroy
     @user = current_user
     @user.destroy
      redirect_to edit_user_path
  end
end
 private
    def user_params
      params.require(:user).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postcode,:address,:email)
    end

