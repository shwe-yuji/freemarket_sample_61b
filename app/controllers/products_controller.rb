class ProductsController < ApplicationController
  def index
    @products = Product.includes(:photos).order('created_at DESC')
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
    @product = Product.find_by(id: params[:id])
    if @product.destroy
      redirect_to root_path, notice: "商品を削除しました"
    else
      flash.now[:alert] = "商品の削除に失敗しました"
      render :show
    end
  end



  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :size_id, :condition_id, 
                                    :delivery_expense_id, :delivery_method_id, :area_id, 
                                    :shipdate_id, :price, :status_id, photos_attributes: [:photo],
                                    brand_attributes: [:name]).merge(user_id: current_user.id)
  end
end