class ProductsController < ApplicationController
  def index
    @products = Product.all.includes(:photos).order('created_at DESC').limit(10)
    @photos = Photo.all
  end

  def show
    
    @product_count=Product.count()
    #クリックされた商品情報を取得
    @product = Product.includes(:photos).find(params[:id])
    #出品者の商品から最新6件取得
    @products_user = Product.includes(:photos).where(user_id: @product.user_id).order('created_at DESC').limit(6)
    #クリックされた商品名と同じものを取得
    @products_name = Product.includes(:photos).where('name like ?',"%#{@product.name}%").limit(6)
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



  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :size_id, :condition_id, 
                                    :delivery_expense_id, :delivery_method_id, :area_id, 
                                    :shipdate_id, :price, :status_id, photos_attributes: [:photo],
                                    brand_attributes: [:name]).merge(user_id: current_user.id)
  end

  
end