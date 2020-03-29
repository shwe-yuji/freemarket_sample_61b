class UsersController < ApplicationController
  def show
  end

  def edit

  end

  def listing_sale
    @products_sale = Product.where( user_id: current_user.id, status_id: 1)
    # ログインユーザーが出品している商品を全て取得する
  end

  def listing_trade
    @products_trade = Product.where( user_id: current_user.id, status_id: [2, 3])
    # ログインユーザーが取引している商品を全て取得する（仮）
  end

  def listing_soldout
    @products_soldout = Product.where( user_id: current_user.id, status_id: 4 )
    # ログインユーザーが売薬済の商品を全て取得する
  end
end
