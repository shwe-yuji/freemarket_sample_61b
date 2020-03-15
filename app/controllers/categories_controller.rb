class CategoriesController < ApplicationController
  def index
    @category_parent = Category.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    # @categoryが子カテゴリの場合,@productsは子カテゴリが入る
    if @category.has_children?
      @products = Product.where(category_id: @category.children).order('created_at DESC')
    # @categoryが子カテゴリではない場合(孫カテゴリの場合),@productsは孫カテゴリが入る
    else @category.childless?
      @products = Product.where(category_id: @category.path_ids).order('created_at DESC')
    end
  end
end