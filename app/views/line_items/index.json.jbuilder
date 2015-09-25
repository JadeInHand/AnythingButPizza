json.array!(@line_items) do |line_item|
  json.extract! line_item, :id, :item_id, :shopping_cart_id, :quantity_purchased
  json.url line_item_url(line_item, format: :json)
end
