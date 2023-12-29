class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token
end
