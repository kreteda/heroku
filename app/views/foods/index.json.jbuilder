json.array!(@foods) do |food|
  json.extract! food, :id, :name, :carbs, :fat, :protein, :sodium, :sugar
  json.url food_url(food, format: :json)
end
