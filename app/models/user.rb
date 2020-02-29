class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :firstname, :lastname, :firstname_kana, :lastname_kana ,:birthdate ,presence: true
  validates :nickname, length:{maximum:20} 
  validates :firstname ,:lastname, :firstname_kana, :lastname_kana, length:{maximum:70}

#   has_one :address dependent: :delete
    has_one :destination, dependent: :delete
#   has_many :transactions, dependent: :nullify
#   has_many :products dependent: :destroy
    has_many :cards

  end
