class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :rating
      t.text :text
      t.references :conf, index: true
      t.references :player, index: true

      t.timestamps
    end
  end
end
