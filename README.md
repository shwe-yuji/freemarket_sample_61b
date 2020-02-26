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
- has_many :transactions dependent: :nullify
- has_many :products dependent: :destroy

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user|reference|unique: true ,null: false ,foreign_key: true|
|postal_code|string||
|area|reference|foreign_key: true|
|city|string||
|street_address|string||
|building_name|string||

### Association

- belongs_to :user
- belongs_to :area

## destinationsテーブル

|Column|Type|Options|
|------|----|-------|
|user|reference|unique: true ,null: false ,foreign_key: true|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|postal_code|string|null: false|
|area_name|string|null: false ,foreign_key: true|
|city|string|null: false|
|street_address|string|null: false|
|building_name|string||
|phone_number|string||

### Association

- belongs_to :user
- belongs_to :area

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|user|reference|null: false ,foreign_key: true|
|name|string|null: false ,index: true|
|description|text|null: false|
|category|reference|null: false ,foreign_key: true|
|size|reference|null: false ,foreign_key: true|
|brand|reference|foreign_key: true|
|condition|integer|null: false|
|shippingexpense|reference|null: false ,foreign_key: true|
|shippingmethod|reference|null: false ,foreign_key: true|
|area|reference|null: false ,foreign_key: true|
|shipdate|integer|null: false|
|price|integer|null: false|
|status|integer|null: false|

### Association

- belongs_to :user
- belongs_to :category
- belongs_to :size
- belongs_to :brand
- belongs_to :shippingexpense
- belongs_to :shippingmethod
- belongs_to :area
- has_one :transaction dependent: :nullify
- has_many :photos dependent: :delete_all

## areasテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false ,unique: true ,index: true|

### Association

- has_many: addresses
- has_many: destinations
- has_many: products

## deliveryexpensesテーブル

|Column|Type|Options|
|------|----|-------|
|bearer|string|null: false ,unique: true ,index: true|

### Association

- has_many: products
- has_many: shippingmethods

## shippingmethodsテーブル

|Column|Type|Options|
|------|----|-------|
|deliveryexpenses|reference|null: false ,foreign_key: true|
|method|string|null: false ,unique: true ,index: true|

### Association

- has_many: products
- belongs_to: deliveryexpense

## photosテーブル

|Column|Type|Options|
|------|----|-------|
|product|reference|null: false ,foreign_key: true|
|photo|string|null: false|

### Association

- belongs_to :product

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false ,unique: true ,index: true|
|ancestry|string|index: true|

### Association

- has_ancestry
- has_many :products
- has_many :categories_brands
- has_many :brands ,through: :categories_brands
- has_many :categories_sizes
- has_many  :sizes ,through: :categories_sizes

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,unique:true|

### Association

- has_many :products
- has_many :categories_brands
- has_many :categories ,through: :categories_brands

## categories_brandsテーブル

|Column|Type|Options|
|------|----|-------|
|category|reference|null: false ,foreign_key: true|
|brand|reference|null: false ,foreign_key: true|

### Association

- belongs_to :category
- belongs_to :brand

## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|size|string|null: false ,unique: true ,index: true|

### Association

- has_many :products
- has_many :categories_sizes
- has_many  :categories ,through:  :categories_sizes

## transactionsテーブル

|Column|Type|Options|
|------|----|-------|
|product|reference|foreign_key: true|
|user|reference|foreign_key: true|

### Association

- belongs_to :product
- belongs_to :user