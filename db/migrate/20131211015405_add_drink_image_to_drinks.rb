class AddDrinkImageToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :drink_image, :string
  end
end
