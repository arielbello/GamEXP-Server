if @player
	json.success true
	json.extract! @player, :id, :name, :custom, :game_id, :created_at, :updated_at
else
	json.success false
	json.error "Couldn't sign in player"
end