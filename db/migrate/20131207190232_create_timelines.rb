class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.integer :user_id
      t.string :nature
      t.integer :game_id
      t.integer :drink_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
