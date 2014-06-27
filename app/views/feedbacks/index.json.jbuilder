json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :rating, :text, :conf_id, :player_id
  json.url feedback_url(feedback, format: :json)
end
