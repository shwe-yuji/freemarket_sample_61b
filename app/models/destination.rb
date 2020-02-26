class Destination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :firstname, :lastname, :firstname_kana, :lastname_kana ,:postal_code,:area_id,:city,:street_address,presence: true
  validates :postal_code,length:{maximum:10}
  validates :firstname ,:lastname, :firstname_kana, :lastname_kana,:street_address, length:{maximum:70}
  validates :user_id , numericality: {only_integer: true} , allow_blank: true
  
  belongs_to :user,optional: true
  belongs_to_active_hash :area
  
end
