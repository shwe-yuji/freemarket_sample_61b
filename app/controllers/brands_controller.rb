class BrandsController < ApplicationController
  
  def group_show
    @category_root = Category.where(ancestry: nil)
    @current_category = Category.find(params[:id])
    current_brand_ids = Product.where(id: @current_category.subtree.ids).pluck(:brand_id)
    @current_brands = Brand.group('name').order('name').where(id: current_brand_ids)
  end

  def show
    @current_brand = Brand.find(params[:id])
    @current_brand_products = Product.where(brand_id: @current_brand.id)
    categories_in_brand_ids = @current_brand_products.pluck(:category_id)
    @categories_in_brand = Category.find(categories_in_brand_ids)
  end

end