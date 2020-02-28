# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false ,unique: true ,index: true|
|password|string|null: false|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|birthdate|date|null: false|
|profile|text||
|image|string||

### Association

- has_one :address dependent: :delete
- has_one :destination dependent: :delete
- has_one :cards dependent: :delete
- has_many :transactions dependent: :nullify
- has_many :products dependent: :destroy

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|unique: true ,null: false ,foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association

- belongs_to :user

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|unique: true ,null: false ,foreign_key: true|
|postal_code|string||
|area_id|integer||
|city|string||
|street_address|string||
|building_name|string||

### Association

- belongs_to :user
- belongs_to_active_hash :area

## destinationsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|unique: true ,null: false ,foreign_key: true|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|postal_code|string|null: false|
|area_id|integer|null: false|
|city|string|null: false|
|street_address|string|null: false|
|building_name|string||
|phone_number|string||

### Association

- belongs_to :user
- belongs_to_active_hash :area

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false ,foreign_key: true|
|name|string|null: false ,index: true|
|description|text|null: false|
|category|references|null: false ,foreign_key: true|
|size_id|integer|null: false|
|brand|references|foreign_key: true|
|condition_id|integer|null: false|
|delivery_expense_id|integer|null: false|
|delivery_method_id|integer|null: false|
|area_id|integer|null: false|
|shipdate_id|integer|null: false|
|price|integer|null: false|
|status_id|integer|null: false ,default: 1|

### Association

- belongs_to :user
- belongs_to :category
- belongs_to :brand optional: true
- belongs_to_active_hash :size
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_expense
- belongs_to_active_hash :delivery_method
- belongs_to_active_hash :area
- belongs_to_active_hash :shipdate
- belongs_to_active_hash :status
- has_one :transaction dependent: :nullify
- has_many :photos dependent: :delete_all

## photosテーブル

|Column|Type|Options|
|------|----|-------|
|product|references|null: false ,foreign_key: true|
|photo|string|null: false|

### Association

- belongs_to :product

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,unique:true|

### Association

- has_many :products

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false ,unique: true ,index: true|
|ancestry|string|index: true|

### Association

- has_ancestry
- has_many :products

## transactionsテーブル

|Column|Type|Options|
|------|----|-------|
|product|references|foreign_key: true|
|user|references|foreign_key: true|

### Association

- belongs_to :product
- belongs_to :user