class ProductsController < ApplicationController
  def index
    @products = Product.includes(:photos).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.photos.new

  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: "商品を出品しました"
    else
      flash.now[:alert] = "商品の出品に失敗しました"
      render :new
    end
    # binding.pry
  end

  def edit
  end

  def update
  end

  def destroy
  end



  private

  def product_params
    params.require(:product).permit(:name, :description,  :category_id, :size_id, :brand_id, :condition_id, 
                                    :delivery_expense_id, :shipping_method_id, :area_id, 
                                    :shipdate_id, :price, :status_id, photos_attributes: [:photo])
  end

end



# t.string :size, null: false, foreign_key: true
# t.text :brand
# t.integer :condition_id, null: false
# t.string :delivery_expense_id, null: false
# t.string :shipping_method_id, null: false
# t.string :area_id, null: false
# t.integer :shipdate_id, null: false
# t.integer :price, null: false
# t.integer :status, null: false