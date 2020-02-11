class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?
  # CSRF保護を無効にする(仮電話番号認証を突破するために必要)↓
  protect_from_forgery with: :null_session 
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:step1, keys: [:nickname,:firstname,:lastname,:firstname_kana,:lastname_kana,:birthdate])

  end
  
  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
