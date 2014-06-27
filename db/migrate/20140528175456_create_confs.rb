class CreateConfs < ActiveRecord::Migration
  def change
    create_table :confs do |t|
      t.string :custom
      t.references :player, index: true
      t.references :game, index: true

      t.timestamps
    end
  end
end
