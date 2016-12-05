json.array!(@to_live_stages) do |to_live_stage|
  json.extract! to_live_stage, :id, :title, :description
  json.url to_live_stage_url(to_live_stage, format: :json)
end
