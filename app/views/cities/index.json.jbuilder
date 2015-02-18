json.array!(@cities) do |city|
  json.extract! city, :id, :city, :province_id, :address, :address_2
  json.url city_url(city, format: :json)
end
