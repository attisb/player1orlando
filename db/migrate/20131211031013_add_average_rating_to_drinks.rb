class AddAverageRatingToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :average, :integer
  end
end
