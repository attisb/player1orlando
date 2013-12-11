class AddBrewerDescriptionToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :brewer_description, :text
  end
end
