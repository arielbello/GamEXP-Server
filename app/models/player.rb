class Player < ActiveRecord::Base
  belongs_to :game
  has_many :confs
  has_many :feedbacks

  validates :custom, presence: true, uniqueness: true
  
end
