class UsersController < ApplicationController
  def show
  end

  def edit
    
  end

  def listing
    @products = Product.where( user_id: current_user.id, status_id: [1, 2, 3])
    # ログインユーザーが出品している商品を全て取得する
  end
  
end
