class ProductsController < ApplicationController
  def index
    sold_product_ids = TransactionRecord.pluck(:product_id)
    # 取引先済みの商品中のカテゴリ・ブランド数上位４つのレコードをインスタンス変数に代入
    @popular_categories = Product.includes(:category).where(id: sold_product_ids).group(:category_id).order('count(category_id) DESC').limit(4)
    @popular_brands = Product.includes(:brand).where(id: sold_product_ids).group(:brand_id).order('count(brand_id) DESC').limit(4)
    # 出品数が多いカテゴリとブランドのidを配列で取得(現在はcategory_idsと@popular_categories.pluck(:category_id)で別の値が出力されます。改善できないため一部仮仕様で実装します)
    # category_ids = @popular_categories.pluck(:category_id)
    brand_ids = @popular_brands.pluck(:brand_id)
    # 人気のカテゴリとブランドの商品を新着順にインスタンス変数に代入(予定。※取引済みの商品も含む)
    # @popular_categories_products = Product.includes(:photos).where(category_id: category_ids).order('created_at DESC')
    @popular_brands_products = Product.includes(:photos).where(brand_id: brand_ids).order('created_at DESC')

    # 新着順に商品をインスタンス変数に代入
    @popular_categories_products = Product.includes(:photos).order('created_at DESC')
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