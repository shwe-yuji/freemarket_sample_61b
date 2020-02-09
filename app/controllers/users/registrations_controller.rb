# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def step1
    @user = User.new
  end

  def step1_regist
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :step1 and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]

    redirect_to phone_regist_path,method: :get
  end

  def step2
    #電話番号認証の実装
    
  end

  def step2_regist
    #特に何もしない
    phone = params[:tel_no] 
    render "step3"
  end

  def step3
    #住所登録
    @address=Address.new
    
  end

  def step3_regist

  end

  def step4
    #お支払い情報
    
  end

  def step4_regist

  end


  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  
  private
  def sign_up_params
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

  def address_params
    params.require(:address).permit(:zipcode, :address)
  end
  # GET /resource/edit
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
