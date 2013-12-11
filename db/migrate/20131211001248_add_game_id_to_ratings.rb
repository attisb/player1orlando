class AddGameIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :game_id, :integer
  end
end
