#ホーム画面へ遷移
crumb :root do
  link "メルカリ", root_path
end

#カテゴリー一覧へ遷移
crumb :category_all do
  link "カテゴリー一覧", categories_path
  parent :root
end

#親カテゴリーが選択された場合
crumb :parent_categories do |category|
  link category, category_path
  parent :category_all
end

#子カテゴリーが選択された場合
crumb :child_categories do |category|
  link category.parent.value, category_path(category.parent.id)
  link category.value, category_path(category.id)
  parent :category_all
end

#孫カテゴリーが選択された場合 
crumb :grand_child_categories do |category|
  link category.parent.parent.value, category_path(category.parent.parent.id)
  link category.parent.value, category_path(category.parent.id)
  link category.value, category_path(category.id)
  parent :category_all
end