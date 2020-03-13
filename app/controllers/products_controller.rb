class ProductsController < ApplicationController

  before_action :set_price, only: [:search]

  def index
    @products = Product.all.includes(:photos).order('created_at DESC').limit(10)
    @photos = Photo.all
  end

  def show
  end

  def new
    @product = Product.new
    @product.photos.new
    @product.build_brand
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: "商品を出品しました"
    else
      flash.now[:alert] = "商品の出品に失敗しました"
      render :new
    end
  end

  def show
    #  出品削除テストビューの記述(後々変更予定)
    @products = Product.includes(:photos).order('created_at DESC')
  end

  def edit
  end

  def update
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to root_path, notice: "商品を削除しました"
    else
      flash.now[:alert] = "商品の削除に失敗しました"
      render :show
    end
  end

  def search
    @search_word = params[:search_word]
    @search_result = Product.search(@search_word).limit(132)
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :size_id, :condition_id, 
                                    :delivery_expense_id, :delivery_method_id, :area_id, 
                                    :shipdate_id, :price, :status_id, photos_attributes: [:photo],
                                    brand_attributes: [:name]).merge(user_id: current_user.id)
  end

  def set_price
    @price_list = ["300 ~ 1000", 
                   "1000 ~ 5000", 
                   "5000 ~ 10000", 
                   "10000 ~ 30000", 
                   "30000 ~ 50000",
                   "50000 ~ "]
  end
  # def search_params
  #   params.require(:product).permit(:name)
  # end
end