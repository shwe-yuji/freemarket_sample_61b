class RenameNameColumnToCategories < ActiveRecord::Migration[5.2]
  def change
    rename_column :categories, :name, :value
  end
end
