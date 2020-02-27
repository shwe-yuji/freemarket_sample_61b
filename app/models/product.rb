class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :user
  belongs_to :brand, optional: true
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_expense
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :size
  belongs_to_active_hash :condition
  belongs_to_active_hash :area
  belongs_to_active_hash :shipdate
  belongs_to_active_hash :status
  has_many :photos
  accepts_nested_attributes_for :photos, allow_destroy: true
  accepts_nested_attributes_for :brand, allow_destroy: true

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :size_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_expense_id, presence: true
  validates :shipping_method_id, presence: true
  validates :area_id, presence: true
  validates :shipdate_id, presence: true
  validates :price, presence: true, inclusion: 300..9999999
end
