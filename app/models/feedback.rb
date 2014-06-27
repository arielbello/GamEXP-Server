class Feedback < ActiveRecord::Base
  belongs_to :conf
  belongs_to :player
  belongs_to :game

  validates :conf_id, :player_id, :game_id, :rating, presence: true
end
