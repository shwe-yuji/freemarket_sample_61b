class CategoriesController < ApplicationController
  include Pagy::Backend
  before_action :title_word

  def index
    @title = "カテゴリー一覧" + @title_end + " " + @title_introduction
    @category_parent = Category.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    @title = @category.value + "(" + @category.root.value + ")" + @title_introduction_other
    if @category.is_root?
      @products = Product.where(category_id: @category.descendant_ids).order('created_at DESC')
      @pagy, @category_products = pagy(Product.where(category_id: @category.descendant_ids))
    elsif @category.childless?
      @products = Product.where(category_id: @category.path_ids).order('created_at DESC')
      @pagy, @category_products = pagy(Product.where(category_id: @category.path_ids))
    else
      @products = Product.where(category_id: @category.subtree_ids).order('created_at DESC')
      @pagy, @category_products = pagy(Product.where(category_id: @category.subtree_ids))
    end
  end
end