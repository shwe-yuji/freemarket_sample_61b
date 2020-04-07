class BrandsController < ApplicationController
  include Pagy::Backend
  before_action :set_current_category, only: [:group_show, :category]
  before_action :title_word

  def group_show
    @title = @current_category.value + @title_end + @title_introduction
    @category_root = Category.where(ancestry: nil)
    current_brand_ids = Product.where(category_id: @current_category.subtree.ids).pluck(:brand_id)
    @current_brands = Brand.group('name').order('name').where(id: current_brand_ids)
  end

  def show
    @current_brand = Brand.find(params[:id])
    @title = @current_brand.name + @title_introduction_other
    @pagy, @current_brand_products = pagy(Product.where(brand_id: @current_brand.id))
    categories_in_brand_ids = @current_brand_products.pluck(:category_id)
    @categories_in_brand = Category.find(categories_in_brand_ids)
  end

  def category
    @current_brand = Brand.find(params[:brand_id])
    @title = @current_brand.name + " " + @current_category.value + @title_introduction_other
    @pagy, @products_in_brand_category = pagy(Product.where(brand_id: @current_brand, category_id: @current_category))
    @brand_category_name = @current_brand.name + " " + @current_category.value
  end

  private

  def set_current_category
    @current_category = Category.find(params[:id])
  end
end