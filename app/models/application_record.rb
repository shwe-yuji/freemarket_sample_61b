class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.set_min_price(min_price)
    if min_price.blank?
      min_price = "300"
    else
      min_price
    end
  end

  def self.set_max_price(max_price)
    if max_price.blank?
      min_price = "9999999"
    else
      max_price
    end
  end
end
