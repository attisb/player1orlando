class AddRatingToKatyCorners < ActiveRecord::Migration
  def change
    add_column :katy_corners, :game_score, :integer
  end
end
