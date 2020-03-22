class TransactionRecord < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :user_id, presence: true
  validates :product_id, presence: true

  def self.judge_sale_or_soldout(judge_product)
    #存在すればtrue：購入済
    TransactionRecord.where(product_id:judge_product.id).present?
  end
end
