class CreateParams < ActiveRecord::Migration
  def change
    create_table :params do |t|
      t.string :name
      t.float :value
      t.references :conf, index: true

      t.timestamps
    end
  end
end
