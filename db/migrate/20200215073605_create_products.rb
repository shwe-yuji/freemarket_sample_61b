class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      # t.reference :user, null: false ,foreign_key: true
      t.string :name, null: false, index: true
      t.text :description, null: false
      t.string :category_id, type: :integer, null: false
      t.string :size_id, null: false, foreign_key: true
      t.integer :status_id, default: 1, null: false
      # t.references :brand, index: true, foreign_key: true
      t.integer :condition_id, null: false
      t.string :delivery_expense_id, null: false
      t.string :shipping_method_id, null: false
      t.string :area_id, null: false
      t.integer :shipdate_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end