
class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
      if resource.id == 1
        admin_orders_path
      else
        root_path # ログイン後に遷移するpathを設定
    end
	end

  def after_sign_up_path_for(resource)
      root_path # ログイン後に遷移するpathを設定
  end

	def after_sign_out_path_for(resource)
	   root_path # ログアウト後に遷移するpathを設定
    end


    protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :address, :phone_number])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
	end

end
