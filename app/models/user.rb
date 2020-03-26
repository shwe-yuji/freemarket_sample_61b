class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  validates :nickname, :firstname, :lastname, :firstname_kana, :lastname_kana, :birthdate, presence: true
  validates :nickname, length:{maximum:20} ,on: :create
  validates :firstname, :lastname, :firstname_kana, :lastname_kana, length:{maximum:70}

#   has_one :address dependent: :delete
    has_one :destination, dependent: :destroy
    accepts_nested_attributes_for :destination, allow_destroy: true, update_only: true
    has_many :transaction_records, dependent: :nullify
    has_many :products, dependent: :destroy
    has_one :card, dependent: :delete
    has_many :sns_credentials, dependent: :delete_all

    def self.from_omniauth(auth)
      sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
      # sns認証したことがあればアソシエーションで取得
      # 無ければemailでユーザー検索して取得orビルド(保存はしない)
      user = sns.user || User.where(email: auth.info.email).first_or_initialize(
        nickname: auth.info.name,
          email: auth.info.email
      )
      # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
      if user.persisted?
        sns.user = user
        sns.save
      end
      user
    end
  end
