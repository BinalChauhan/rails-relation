class ApplicationController < ActionController::Base
  before_action :authenticate_account!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :image])
  end
end
