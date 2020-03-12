class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :product, index:{unique: true}, foreign_key: true, null: false
      t.timestamps
    end
  end
end
