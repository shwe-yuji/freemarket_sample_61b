class Users::RegistrationsController < Devise::RegistrationsController
  require "payjp"
  # before_action :set_card, only: [:step4_regist]
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :delete_sms_num, only: [:step3]

  def step1
    @user = User.new
  end

  def step1_regist
    params[:user][:birthdate] = join_birthdate
    @user = User.new(user_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :step1 and return
    end
    session["devise.regist_data"] = { user: @user.attributes }
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @destination = @user.build_destination
    redirect_to phone_regist_path
  end

  def step2
  end

  def step2_regist
  #   # 秘密鍵を共有していないためコメントアウト
  #   input_phone_number = params[:telephone].sub(/\A./,'+81').gsub(/-/,"").to_i
  #   sms_num = rand(10000..99999)
  #   session[:sms_num] = sms_num
  #   client = Twilio::REST::Client.new(config.account_sid, config.auth_token)
  #   begin
  #     client.messages.create(
  #       from: Rails.application.credentials[:TWILIO_NUMBER],
  #       to: input_phone_number,
  #       body: "#{sms_num}を入力してください"
  #     )
  #   rescue Twilio::REST::RestError => e
  #   end
    redirect_to phone_confirm_path
  end

  def phone_confirm
  end

  def phone_confirm_input
    # # 秘密鍵を共有していないためコメントアウト
    # input_sms_number = params[:input_sms_number].to_i
    # if session[:sms_num] === input_sms_number
      redirect_to destination_regist_path
    # else
    #   redirect_to phone_regist_path
    # end
  end

  def step3
    @destination = Destination.new
  end

  def step3_regist
    @user = User.new(session["devise.regist_data"]["user"])
    @destination = Destination.new(destination_params)
    unless @destination.valid?
      flash.now[:alert] = @destination.errors.full_messages
      render :step3 && return
    end
    session["devise.regist_data"] = { destination: @destination.attributes }
    @destination[:user_id] = @user[:id]
    @user.build_destination(@destination.attributes)
    @user.save
    sign_in(:user, @user)
    redirect_to creditcard_regist_path, method: :get
  end

  def step4
    card = Card.where(user_id: current_user.id).first
    redirect_to :root if card.present?
    # redirect_to creditcard_regist_path, method: :post
  end

  def step4_regist
    #秘密鍵共有していないためコメントアウト
    # Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    # if params['payjp-token'].blank?
    #   redirect_to creditcard_regist_path, method: :get
    # else

    #   customer = Payjp::Customer.create(
    #     description: 'test',
    #     email: current_user.email,
    #     card: params['payjp-token'],
    #     metadata: { user_id: current_user.id }
    #   )
    #   @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    #   if @card.save
        redirect_to registed_path, method: :post

      # else
      #   redirect_to creditcard_regist_path, method: :get
      # end
    # end
  end

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end

  def user_params
    params.require(:user).permit(:nickname,
                                 :password,
                                 :email,
                                 :firstname,
                                 :lastname,
                                 :firstname_kana,
                                 :lastname_kana,
                                 :birthdate
    )
  end

  def join_birthdate
    return Date.new params[:user]["birthdate(1i)"].to_i, params[:user]["birthdate(2i)"].to_i, params[:user]["birthdate(3i)"].to_i
  end

  def destination_params
    params.require(:destination).permit(:firstname,
                                    :firstname_kana,
                                    :lastname,
                                    :lastname_kana,
                                    :postal_code,
                                    :area_id,
                                    :city,
                                    :street_address,
                                    :building_name,
                                    :phone_number
    )
  end

  def delete_sms_num
    session.delete(:sms_num)
  end

  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
