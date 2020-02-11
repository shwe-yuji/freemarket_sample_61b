class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.references  :user , index:{unique: true},foreign_key: true,null:false
      t.string :firstname ,null: false
      t.string :lastname ,null: false
      t.string :firstname_kana ,null: false
      t.string :lastname_kana,null: false
      t.string :postal_code ,null: false
      t.references :area ,foreign_key: true , null: false
      t.string  :city,null: false
      t.string  :street_address,null: false
      t.string  :building_name
      t.string :phone_number
      t.timestamps
    end
  end
end
  