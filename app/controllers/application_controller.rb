class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?
  
  protected	
  
  def configure_permitted_parameters	
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

  # 一部のページタイトルで共通する文言を変数に格納
  def title_word
    @title_end = " - Fmarket"
    @title_first = "Fmarket "
    @title_introduction = " スマホでかんたん フリマアプリ"
    @title_introduction_other = "の中古/新品通販【Fmarket】No.2フリマアプリ"
  end

end
