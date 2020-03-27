class Brand < ApplicationRecord
  has_many :products

  def self.get_brand(brand_name) 
    Brand.where(['name LIKE ?', "%#{brand_name}%"]).ids  
  end
end
