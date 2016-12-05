json.array!(@to_live_players) do |to_live_player|
  json.extract! to_live_player, :id, :name, :wins
  json.url to_live_player_url(to_live_player, format: :json)
end
