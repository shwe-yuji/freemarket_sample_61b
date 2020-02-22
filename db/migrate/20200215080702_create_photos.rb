class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|

      t.timestamps
      t.references :product, null: false, foreign_key: true
      t.string :photo, null: false
    end
  end
end
