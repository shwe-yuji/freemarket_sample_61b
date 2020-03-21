class CreditCardsController < ApplicationController
  require 'payjp'
  before_action :set_card

  # 後ほど登録したクレジットの表示画面を作成します。
  def index
  end
  def buy #クレジット購入
    if @card.blank?
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @product = Product.find(params[:id])
     # 購入した際の情報を元に引っ張ってくる
      @card = current_user.card
     # テーブル紐付けてるのでログインユーザーのクレジットカードを引っ張ってくる
     # 本番と記述方式が異なるので注意
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
     # キーをセットする(環境変数においても良い)
      Payjp::Charge.create(
      amount: @product.price, #支払金額
      customer: @card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
     # 商品の金額をamountへ、cardの顧客idをcustomerへ、currencyをjpyへ入れる
     @transaction = TransactionRecord.new(product_id: params[:id], user_id: current_user.id) 
     if @transaction.save
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
  # 後ほど削除機能を実装します。
  def destroy
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
