crumb :root do
  link "Home", root_path
end

# items#index
crumb :user do
  link "マイページ", user_path
  parent :root
end

crumb :search_items do
  link "検索結果", search_items_path
  parent :root
end

crumb :new_item do
  link "商品出品ページ", new_item_path
  parent :root
end

crumb :item do
  link "商品詳細ページ", item_path
  parent :root
end
# items#index

# users#show

# users#show

# items#show
# crumb :edit_item do
#   link "編集ページ", edit_item_path
#   parent :item
# end

# crumb :item_orders do
#   link "購入ページ", item_orders_path
#   parent :item
# end

# crumb :user do
#   link "ユーザーページ", user_path
#   parent :item
# end
# items#show
