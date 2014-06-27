json.array!(@params) do |param|
  json.extract! param, :id, :name, :value, :conf_id
  json.url conf_param_url(param.conf, param, format: :json)
end
