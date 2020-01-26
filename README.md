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
