class AddCategoryToDrink < ActiveRecord::Migration
  def change
    add_column :drinks, :category_id, :integer
  end
end
