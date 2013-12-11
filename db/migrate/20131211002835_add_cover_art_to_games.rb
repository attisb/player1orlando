class AddCoverArtToGames < ActiveRecord::Migration
  def change
    add_column :games, :cover_art, :string
  end
end
