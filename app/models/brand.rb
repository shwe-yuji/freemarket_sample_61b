class Brand < ApplicationRecord
  has_many :products

  scope :get_brand, -> (brand_name){where(['name LIKE ?', "%#{brand_name}%"]).ids}

end
