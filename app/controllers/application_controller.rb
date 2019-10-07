class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:signup,keys:[:username,:name])
		devise_parameter_sanitizer.permit(:account_update,keys:[:username, :name])
	end
end
