class AddGameToFeedback < ActiveRecord::Migration
  def change
    add_reference :feedbacks, :game, index: true
  end
end
