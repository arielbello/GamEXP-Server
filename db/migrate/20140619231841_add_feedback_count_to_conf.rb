class AddFeedbackCountToConf < ActiveRecord::Migration
  def change
    add_column :confs, :feedback_count, :integer, default: 0
    add_column :confs, :rating, :float, default: 0
  end
end
