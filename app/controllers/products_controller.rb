class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:destroy]
  before_action :set_pulldown, only: [:search, :detail_search]
  before_action :set_search_word, only: [:search, :detail_search]
  before_action :authenticate_user!, only: [:new]

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
    # 商品数カウント
    @product_count=Product.count()
    # 出品者の商品から最新6件取得
    @user_products = Product.includes(:photos).where(user_id: @product.user_id).order('created_at DESC').limit(6)
    # クリックされた商品名と同じものを取得
    @same_name_products = Product.includes(:photos).where('name like ?',"%#{@product.name}%").limit(6)
    # 販売中か購入済かを調べる
    @sell_or_buy = TransactionRecord.judge_sale_or_soldout(@product)
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
    # 出品済みの商品を選んだら、その商品の情報を全て取得する
    # @products = Product.includes.find(params[:id])
  end

  def update
    # 更新した内容をsaveさせる
    # editアクションで全て上書きされるように
    # redirect to listing
  end

  def destroy
    if @product.destroy
      redirect_to root_path, notice: "商品を削除しました"
    else
      flash.now[:alert] = "商品の削除に失敗しました"
      render :show
    end
  end

  def search
    #検索ワード入力時、スペースを半角スペースに変換して、splitメソッドで検索ワードを配列に格納
    @search_words = params[:search_word].gsub(/[[:blank:]]/, " ").split(" ")
    @search_words.each do |search_word|
      @search_result = Product.all.includes(:photos, :brand, :category, :transaction_record).search(search_word).limit(132)
    end
    #検索ワードが空の場合、新着商品のデータを取得
    @products_new = Product.all.includes(:photos, :brand, :category, :transaction_record).order('created_at DESC')
  end

  def detail_search
    # # カテゴリー検索
    selected_category_id = params[:category_id].to_i
    if selected_category_id == 0
      category_ids = Category.all.ids
    else
      category_ids = Category.find(selected_category_id).subtree_ids
    end

    # #ブランド検索
    input_brand_name = params[:brand_name]
    brand_ids = Brand.where(['name LIKE ?', "%#{input_brand_name}%"]).ids
    
    # サイズで検索
    selected_size_id = params[:size_id]
    if selected_size_id == ""
      size_ids = (1..Size.all.length).to_a
    else
      size_ids = selected_size_id
    end
    
    #価格検索
    input_min_price = params[:min_price]
    if input_min_price.blank?
      input_min_price = "300"
    end
    input_max_price = params[:max_price]
    if input_max_price.blank?
      input_max_price = "9999999"
    end

    # 商品の状態で検索
    checked_condition_ids = params[:condition_id]
    if checked_condition_ids == [""]
      condition_ids = (1..Condition.all.length).to_a
    else
      condition_ids = checked_condition_ids
    end
   
    # #配送料の負担方法で検索
    checked_delivery_expense_ids = params[:delivery_expense_id]
    if checked_delivery_expense_ids == [""]
      delivery_expense_ids = (1..DeliveryExpense.all.length).to_a
    else
      delivery_expense_ids = checked_delivery_expense_ids
    end

    # 販売状況で検索
    checked_status_ids = params[:status_id]
    if checked_status_ids == [""]
      status_ids = (1..Status.all.length).to_a
    else
      status_ids = checked_status_ids
    end

    @search_words = params[:detail_search_word].gsub(/[[:blank:]]/, " ").split(" ")
    @search_words.each do |search_word|
      @search_result = Product.all.includes(:photos, :brand, :category, :transaction_record).search(search_word).where(
                                                                        category_id: category_ids, 
                                                                        brand_id: brand_ids, 
                                                                        size_id: size_ids,
                                                                        price: input_min_price..input_max_price,
                                                                        condition_id: condition_ids,
                                                                        delivery_expense_id: delivery_expense_ids,
                                                                        status_id: status_ids
                                                               )
    end
    
   @products_new = Product.includes(:photos, :brand, :category).order('created_at DESC')
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :size_id, :condition_id,
                                    :delivery_expense_id, :delivery_method_id, :area_id,
                                    :shipdate_id, :price, :status_id, photos_attributes: [:photo],
                                    brand_attributes: [:name]).merge(user_id: current_user.id)
  end

  def set_pulldown
    @price_list = ["300 ~ 1000",
                   "1000 ~ 5000",
                   "5000 ~ 10000",
                   "10000 ~ 30000",
                   "30000 ~ 50000",
                   "50000 ~ 100000"]

    @list_change = ["価格の安い順",
                    "価格の高い順",
                    "出品の新しい順",
                    "いいね！の多い順"]
  end

  def set_product
    @product = Product.includes(:photos).find(params[:id])
  end 

  def set_search_word
    @search_word = params[:search_word]
    @detail_search_word = params[:detail_search_word]
  
  end
end
