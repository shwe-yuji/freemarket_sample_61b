crumb :root do
  link "メルカリ", root_path
end

crumb :category_all do
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :parent_categories do |category|
  link category.name, category_path
  parent :category_all
end

crumb :child_categories do |category|
  link category.name, category_path
  parent :parent_categories
end