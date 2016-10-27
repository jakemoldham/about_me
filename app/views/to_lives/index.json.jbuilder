json.array!(@to_lives) do |to_life|
  json.extract! to_life, :id, :player, :stage, :wins
  json.url to_life_url(to_life, format: :json)
end
