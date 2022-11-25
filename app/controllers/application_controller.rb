class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :location, :about])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :location, :about])
  end

  def after_sign_in_path_for(resource)
    user_path(@user, redir_param: 21, accord_param: "flush-headingTwo") # your path
  end
end
