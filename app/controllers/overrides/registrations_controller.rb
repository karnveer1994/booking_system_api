class Overrides::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(first_name email role last_name password provider))
    devise_parameter_sanitizer.permit(:user_update, keys: %i(first_name last_name password))
  end
end