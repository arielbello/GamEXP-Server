if @success
	json.success true
	json.extract! @feedback, :id, :rating, :text, :conf_id, :player_id, :created_at, :updated_at
else
	json.success false
	json.error "Couldn't create feedback"
end
