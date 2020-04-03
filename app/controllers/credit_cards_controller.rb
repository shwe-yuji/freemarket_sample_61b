class CreditCardsController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!, only: [:buy]
  before_action :set_card

  def buy
    if @card.blank?
      redirect_to :root
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @product = Product.find(params[:id])
      if Rails.env.development? || Rails.env.test? 
        Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      else
        Payjp.api_key = Rails.application.credentials[:PAYJP_SECRET_KEY]
      end
      Payjp::Charge.create(
      amount: @product.price,
      customer: @card.customer_id,
      currency: 'jpy',
      )
     @transaction = TransactionRecord.new(product_id: params[:id], user_id: current_user.id) 

      if !judge_sale_or_soldout && @transaction.save
        @product.update(status_id: '4')
        flash[:notice] = '購入しました。'
        redirect_to done_product_path(@product), method: :get
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to :root
      end
    end
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
