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

- has_one :address
- has_one :destination
- has_many :transactions
- has_many :products
- has_many :comments

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|unique: true ,null: false ,aforeign_key: true|
|postal_code|string|null: false|
|area_name|string|null: false ,foreign_key: true|
|city|string|null: false|
|street_address|string|null: false|
|building_name|string|null: false|

### Association

- belongs_to :user
- belongs_to :area

## destinationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|unique: true ,null: false ,foreign_key: true|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|postal_code|varchar(8)|null: false|
|area_name|string|null: false ,foreign_key: true|
|city|string|null: false|
|street_address|string|null: false|
|building_name|string||
|phone_number|varchar(15)||

### Association

- belongs_to :user
- belongs_to :area

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false ,foreign_key: true|
|name|string|null: false ,index: true|
|description|text|null: false|
|category_name|string|null: false ,foreign_key: true|
|size_size|string|null: false ,foreign_key: true|
|brand_name|string||
|condition|integer|null: false|
|shippingexpense_bearer|string|null: false ,foreign_key: true|
|shippingmethod_method|string|null: false ,foreign_key: true|
|area_name|string|null: false ,foreign_key: true|
|shipdate_date|string|null: false ,foreign_key: true|
|price|integer|null: false|

### Association

- belongs_to :user
- belongs_to :category
- belongs_to :size
- belongs_to :shippingexpense
- belongs_to :shippingmethod
- belongs_to :area
- belongs_to :shipdate
- has_many :photos

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
|deliveryexpenses_id|reference|null: false ,foreign_key: true|
|method|string|null: false ,unique: true ,index: true|

### Association

- has_many: products
- belongs_to: deliveryexpense

## shipdatesテーブル

|Column|Type|Options|
|------|----|-------|
|date|string|null: false ,unique: true ,index: true|

### Association

 - has_many: products

## photosテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|reference|null: false ,foreign_key: true|
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
|category_id|reference|null: false ,foreign_key: true|
|brand_id|reference|null: false ,foreign_key: true|

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
|product_id|reference|null: false ,foreign_key: true|
|user_id|reference|foreign_key: true|
|done|boolean||

### Association

- belongs_to :product
- belongs_to :user