json.array!(@to_live_answers) do |to_live_answer|
  json.extract! to_live_answer, :id, :question_id, :answer, :choose, :correct
  json.url to_live_answer_url(to_live_answer, format: :json)
end
