class Users::RegistrationsController < Devise::RegistrationsController
  require "payjp"
  before_action :set_card, only: [:step4_regist]
  # before_action :configure_account_update_params, only: [:update]
  before_action :delete_sms_num, only: [:step3]
  before_action :title_word

  def new
    @title = "会員情報入力" + @title_end + @title_introduction
  end

  def step1
    @title = "会員情報入力" + @title_end + @title_introduction
    @user = User.new
  end

  def step1_regist
    params[:user][:birthdate] = join_birthdate
    @user = User.new(create_user_params)
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
    @title = "電話番号の確認" + @title_end + @title_introduction
  end

  def step2_regist
    # input_phone_number = params[:telephone].sub(/\A./,'+81').gsub(/-/,"")
    # sms_num = rand(10000..99999)
    # session[:sms_num] = sms_num
    # client = Twilio::REST::Client.new(config.account_sid, config.auth_token)
    # begin
    #   client.messages.create(
    #     from: Rails.application.credentials[:TWILIO_NUMBER],
    #     to: input_phone_number,
    #     body: "#{sms_num}を入力してください"
    #   )
    # rescue Twilio::REST::RestError => e
    # end
    redirect_to phone_confirm_path
  end

  def phone_confirm
    @title = "電話番号の確認" + @title_end + @title_introduction
  end

  def phone_confirm_input
    #  秘密鍵共有していないためコメントアウト
    # input_sms_number = params[:input_sms_number].to_i
    # if session[:sms_num] === input_sms_number
      redirect_to destination_regist_path
    # else
    #   redirect_to phone_regist_path
    # end
  end

  def step3
    @title = "住所入力" + @title_end + @title_introduction
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
    @title = "支払い方法" + @title_end + @title_introduction
    card = Card.where(user_id: current_user.id).first
    redirect_to :root if card.present?
  end

  def step4_regist
    if Rails.env.development? || Rails.env.test? 
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    else
      Payjp.api_key = Rails.application.credentials[:PAYJP_SECRET_KEY]
    end
    if params['payjp-token'].blank?
      redirect_to creditcard_regist_path, method: :get
    else
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjp-token'],
        metadata: { user_id: current_user.id }
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to registed_path, method: :post

      else
        redirect_to creditcard_regist_path, method: :get
      end
    end
  end

  def finish_regist
    @title = "会員登録完了" + @title_end + @title_introduction
  end

  def edit
    @title = "プロフィール" + @title_end + @title_introduction
    super
    #ユーザプロフィール？エラー解消のためparams[:format]に修正
    @user = User.find(params[:format])
    @destination = @user.destination
  end

  def update
    if current_user.update!(update_user_params)
      flash[:notice] = '変更しました'
      redirect_to root_path, notice: "本人情報を登録"
    end
  end
  
  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
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

  def update_user_params
    params.require(:user).permit(destination_attributes: [:postal_code, :area_id, :city, :street_address, :building_name])
  end

  def create_user_params
    params.require(:user).permit(:nickname,
                                 :password,
                                 :email,
                                 :firstname,
                                 :lastname,
                                 :firstname_kana,
                                 :lastname_kana,
                                 :birthdate)
  end


  # PUT /resource


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
