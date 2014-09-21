json.array!(@items) do |item|
  json.extract! item, :id, :description, :opened
  json.url item_url(item, format: :json)
end
