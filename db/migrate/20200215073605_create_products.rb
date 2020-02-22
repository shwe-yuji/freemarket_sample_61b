class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.timestamps
      t.string :name, nul: false, index: true
      t.integer :price, null: false
    end
  end
end
