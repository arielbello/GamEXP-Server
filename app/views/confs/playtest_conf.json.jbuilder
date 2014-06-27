if @conf
	json.success true
	json.extract! @conf, :id, :custom
	json.player @conf.player

	json.params do
		json.array!(@conf.params) do |param|
		  json.extract! param, :id, :name, :value, :conf_id
		end
	end
else
	json.success false
	json.error "couldn't fetch community configuration"
end
