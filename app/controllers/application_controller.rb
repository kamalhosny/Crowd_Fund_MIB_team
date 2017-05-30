class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # include DeviseTokenAuth::Concerns::SetAdminByToken
  include ActionController::MimeResponds
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json

  devise_token_auth_group :member, contains: [:user, :admin]
  before_action :authenticate_member!, unless: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username age gender credit_card])
  end
end
