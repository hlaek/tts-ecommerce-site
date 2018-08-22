class ApplicationController < ActionController::Base

before_action :fetch_categories, :fetch_brands

before_action :configure_permitted_parameters, if: :devise_controller? 

helper_method :current_order

	def fetch_categories
		@categories = Category.order (:name)
	end

	def fetch_brands
		@brands = Product.pluck(:brand).sort.uniq
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
		devise_parameter_sanitizer.permit(:account_update, keys: [:role])
	end

	def current_order
		if !session[:order_id].nil?
			Order.find(session[:order_id])
		else
			Order.new
		end
	end
end
