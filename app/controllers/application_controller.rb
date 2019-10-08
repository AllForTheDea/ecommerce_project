class ApplicationController < ActionController::Base
	before_action :categories, :brands
	before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:signup,keys:[:username,:name, :role])
		devise_parameter_sanitizer.permit(:account_update,keys:[:username, :name, :role])
	end


	def categories
		@categories = Category.order(:name)
	end

	def brands
		@brands = Product.pluck(:brand).sort.uniq
	end

	rescue_from CanCan::AccessDenied do |exception|
		respond_to do |format|
			format.json {head :forbidden}
			format.html {redirect_to main_app.product_url, alert: "Not authorized!"}
		end
	end


end
