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
|postal_code|varchar(7)||
|area_name|integer|foreign_key: true|
|city|string||
|street_address|string||
|building_name|string||
|profile|text||
|image|string||

### Association

- belongs_to :area
- has_one :destination
- has_many :transactions
- has_many :products
- has_many :comments

## destinationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|unique: true ,null: false ,foreign_key: true|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|postal_code|varchar(8)|null: false|
|area_name|integer|null: false ,foreign_key: true|
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
|user_id|integer|null: false ,foreign_key: true|
|name|string|null: false ,index: true|
|description|text|null: false|
|category_name|string|null: false ,foreign_key: true|
|subcategory_name|string|null: false ,foreign_key: true|
|subsubcategory_name|string|null: false ,foreign_key: true|
|size_size|string|null: false ,foreign_key: true|
|brand_name|string||
|condition_name|string|null: false ,foreign_key: true|
|shippingexpense_bearer|string|null: false ,foreign_key: true|
|shippingmethod_method|string|null: false ,foreign_key: true|
|area_name|string|null: false ,foreign_key: true|
|shipdate_date|string|null: false ,foreign_key: true|
|price|integer|null: false|

### Association

- belongs_to :user
- belongs_to :category
- belongs_to :subcategory
- belongs_to :subsubcategory
- belongs_to :size
- belongs_to :condition
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

- has_many: users
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
|deliveryexpenses_id|integer|null: false ,foreign_key: true|
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
|user_id|integer|null: false ,foreign_key: true|
|photo|string|null: false|

### Association

- belongs_to :product

## conditionsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false ,unique: true ,index: true|

### Association

- has_many :products

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false ,unique: true ,index: true|

### Association

- has_many :subcategories
- has_many :products
- has_many :categories_brands
- has_many :brands ,through: :categories_brands

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
|category_id|integer|null: false ,foreign_key: true|
|brand_id|integer|null: false ,foreign_key: true|

### Association

- belongs_to :category
- belongs_to :brand

## subcategoriesテーブル

|Column|Type|Options|
|------|----|-------|
|category_id|integer|null: false ,foreign_key: true|
|name|string|null: false ,unique: true ,index: true|

### Association

- belongs_to :category
- has_many :subsubcategories
- has_many :products
- has_many :subcategories_sizes
- has_many  :sizes ,through: :subcategories_sizes

## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|size|string|null: false ,unique: true ,index: true|

### Association

- has_many :products
- has_many :subcategories_sizes
- has_many  :subcategories ,through:  :subcategories_sizes

## subcategories_sizesテーブル

|Column|Type|Options|
|------|----|-------|
|subcategory_id|integer|null: false ,foreign_key: true|
|size_id|integer|null: false ,foreign_key: true|

### Association

- belongs_to :subcategory
- belongs_to :size

## subsubcategoriesテーブル

|Column|Type|Options|
|------|----|-------|
|subcategory_id|integer|null: false ,foreign_key: true|
|name|string|null: false ,unique: true ,index: true|

### Association

- has_many :products
- belongs_to :subcategory

## transactionsテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false ,foreign_key: true|
|user_id|integer|foreign_key: true|
|done|boolean||

### Association

- belongs_to :product
- belongs_to :user