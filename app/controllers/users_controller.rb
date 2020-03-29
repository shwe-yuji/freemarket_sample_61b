class UsersController < ApplicationController
  def show
  end

  def edit

  end

  def listing_sale
    @title = "出品した商品 - 出品中"
    @products_sale = Product.where( user_id: current_user.id, status_id: 1)
    # ログインユーザーが出品している商品を全て取得する
  end

  def listing_trade
    @title = "出品した商品 - 取引中"
    @products_trade = Product.where( user_id: current_user.id, status_id: [2, 3])
    # ログインユーザーが取引している商品を全て取得する（仮）
  end

  def listing_soldout
    @title = "出品した商品 - 売却済"
    @products_soldout = Product.where( user_id: current_user.id, status_id: 4 )
    # ログインユーザーが売薬済の商品を全て取得する
  end
end
