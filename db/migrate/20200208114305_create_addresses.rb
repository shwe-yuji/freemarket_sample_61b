class CreateAddresses < ActiveRecord::Migration[5.2]
    def change
      create_table :addresses do |t|
        t.references  :user , index:{unique: true},foreign_key: true,null:false
        t.string :postal_code 
        t.references :area ,foreign_key: true
        t.string  :city
        t.string  :street_address
        t.string  :building_name
        t.timestamps
      end
    end
  end
  