class AddCategoryToGames < ActiveRecord::Migration
  def change
    add_column :games, :category_id, :integer
  end
end
