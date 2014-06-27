class Game < ActiveRecord::Base
	has_many :players
	has_many :confs
	has_many :feedbacks
end
