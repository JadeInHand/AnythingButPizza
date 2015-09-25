json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :address, :latitude, :longitude, :postcode, :image
  json.url user_url(user, format: :json)
end
