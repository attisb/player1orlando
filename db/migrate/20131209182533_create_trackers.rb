class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.integer :user_id
      t.integer :drink_id
      t.integer :points

      t.timestamps
    end
  end
end
