json.array!(@to_live_questions) do |to_live_question|
  json.extract! to_live_question, :id, :stage_id, :title, :body, :answer, :true_false
  json.url to_live_question_url(to_live_question, format: :json)
end
