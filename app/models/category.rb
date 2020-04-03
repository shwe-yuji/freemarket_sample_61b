class Category < ApplicationRecord
  has_many :products
  has_ancestry

  def self.get_category(category_id)
    if category_id == 0
      Category.all.ids
    else
      Category.find(category_id).subtree_ids
    end
  end

  def self.conversion_root_ids(category_ids)
    refine_categories = Category.where(id: category_ids)
    # category_idsをルートIDに変換
    root_ids = []
    refine_categories.each do |category|
      root_ids << category.root_id
    end
    root_ids
  end
end
