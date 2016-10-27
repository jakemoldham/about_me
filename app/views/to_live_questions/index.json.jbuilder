json.array!(@to_live_questions) do |to_live_question|
  json.extract! to_live_question, :id, :title, :body, :answer
  json.url to_live_question_url(to_live_question, format: :json)
end
