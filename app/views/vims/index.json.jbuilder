json.array!(@vims) do |vim|
  json.extract! vim, :id, :title, :code, :description
  json.url vim_url(vim, format: :json)
end
