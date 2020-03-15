class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?
  
  protected	
  def configure_permitted_parameters	
    binding.pry
    devise_parameter_sanitizer.permit(:step1, keys: [:nickname, :firstname, :lastname, :firstname_kana, :lastname_kana, :birthdate])	
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
