json.array!(@confs) do |conf|
  json.extract! conf, :id, :custom, :player_id, :game_id
  json.url conf_url(conf, format: :json)
end
