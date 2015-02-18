json.array!(@provinces) do |province|
  json.extract! province, :id, :province
  json.url province_url(province, format: :json)
end
