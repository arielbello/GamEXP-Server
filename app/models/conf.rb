class Conf < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  has_many :params
  has_many :feedbacks
end
