json.array!(@items) do |item|
  json.extract! item, :id, :name, :servings, :cost, :description, :tags, :image, :active, :user_id, :category_id
  json.url item_url(item, format: :json)
end
