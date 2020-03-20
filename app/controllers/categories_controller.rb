class CategoriesController < ApplicationController
  def index
    @category_parent = Category.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    if @category.is_root?
      @products = Product.where(category_id: @category.descendant_ids).order('created_at DESC')
    elsif @category.childless?
      @products = Product.where(category_id: @category.path_ids).order('created_at DESC')
    else
      @products = Product.where(category_id: @category.subtree_ids).order('created_at DESC')
    end
  end
end