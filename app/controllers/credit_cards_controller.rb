class CreditCardsController < ApplicationController
  require 'payjp'
  before_action :set_card

  def buy #クレジット購入
    if @card.blank?
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @product = Product.find(params[:id])
      if Rails.env.development? || Rails.env.test? 
        Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      else
        Payjp.api_key = Rails.application.credentials[:PAYJP_SECRET_KEY]
      end
      Payjp::Charge.create(
      amount: @product.price, #支払金額
      customer: @card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
     @transaction = TransactionRecord.new(product_id: params[:id], user_id: current_user.id) 

      if !judge_sale_or_soldout
        @transaction.save
        flash[:notice] = '購入しました。'
        redirect_to done_product_path(@product), method: :get
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to :root
      end
    end
  end


  # クレジットカード情報入力画面
  # def new
  #   if @card
  #     redirect_to card_path unless @card
  #   else
  #     render 'mypages/create_card'
  #   end
  # end

  # 登録画面で入力した情報をDBに保存
  # def create
  #   Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  #   if params['payjp-token'].blank?
  #     render 'mypages/create_card'
  #   else
  #     customer = Payjp::Customer.create( # ここで先ほど生成したトークンを顧客情報と紐付け、PAY.JP管理サイトに送信
  #       email: current_user.email,
  #       card: params['payjp-token'],
  #       metadata: {user_id: current_user.id} # 記述しなくても大丈夫です
  #     )
  #     @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
  #     if @card.save
  #       redirect_to cards_path
  #     else
  #       render 'mypages/create_card'
  #     end
  #   end
  # end

  def show
  end

  def destroy
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end

  def judge_sale_or_soldout
    #存在すればtrue：購入済
    TransactionRecord.where(product_id:params[:id]).present?
  end
end
