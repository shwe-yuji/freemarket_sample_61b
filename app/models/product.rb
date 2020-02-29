class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :brand
  belongs_to_active_hash :area
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipdate
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :condition_id, presence: true
  validates :area_id, presence: true
  validates :shipdate_id, presence: true
  validates :price, presence: true, inclusion: 300..9999999
  # validates :delivery_charge_id, presence: true
  # validates :prefecture_id, presence: true
  # validates :delivery_days_id, presence: true
end
