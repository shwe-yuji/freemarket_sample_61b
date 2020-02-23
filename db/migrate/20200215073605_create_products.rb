class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.timestamps
      # t.reference :user, null: false ,foreign_key: true
      t.string :name, null: false, index: true
      t.text :description, null: false
      # t.reference :category, null: false ,foreign_key: true
      # t.reference :size, null: false ,foreign_key: true
      # t.references :brand, foreign_key: true
      t.integer :condition_id, null: false
      # t.reference :shippingexpense, null: false ,foreign_key: true
      # t.reference :shippingmethod, null: false ,foreign_key: true
      t.string :area_id, null: false ,foreign_key: true
      t.integer :shipdate_id, null: false
      t.integer :price, null: false
      # t.integer :status, null: false 取引状態
    end
  end
end

# Column	Type	Options
# user	reference	null: false ,foreign_key: true
# name	string	null: false ,index: true
# description	text	null: false
# category	reference	null: false ,foreign_key: true
# size	reference	null: false ,foreign_key: true
# brand	reference	foreign_key: true
# condition	integer	null: false
# shippingexpense	reference	null: false ,foreign_key: true
# shippingmethod	reference	null: false ,foreign_key: true
# area	reference	null: false ,foreign_key: true
# shipdate	integer	null: false
# price	integer	null: false
# status	integer	null: false